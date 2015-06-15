class Spree::LikesController < Spree::StoreController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper 'spree/products'
  def get_likes
    ids = params[:product_id]
    user_favourites = []
    user_favourites = current_user.likes.pluck(:product_id) unless current_user.nil?
    product_favourites = Spree::Product.joins(:product_extension).joins(:likes).active.where(:id => ids).map{|e| {:product_id => e.id, :likes => e.likes.count + e.initial_favourites.to_i}}
    render :json => {user_favourites: user_favourites.to_json, product_favourites: product_favourites}
  end
  def like_product
    if !current_user.nil?
      current_user.like(product)
      render :json => {status: 'ok', product_id: product.id}
    else
      render :json => {status: 'fail', message: 'not_logged'}
    end
  end

  def unlike_product
    product.likes.where(user_id: current_user.id).destroy_all
    render :json => {status: 'ok', product_id: product.id}
  end

  def index
    if !current_user.nil?
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products
      @products = @products.where(id: current_user.likes.pluck(:product_id))
    else
      redirect_to :root
    end
  end

  private

  def product
    @product ||= Spree::Product.find(params[:id])
  end
end
