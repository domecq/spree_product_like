class Spree::LikesController < Spree::StoreController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper 'spree/products'
  def like_product
    current_user.like(product)
    render :json => {status: 'ok', product_id: product.id}
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
