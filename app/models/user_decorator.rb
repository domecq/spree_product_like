Spree.user_class.class_eval do
  has_many :likes, :class_name => 'Spree::Like'

  def like(product)
    self.likes.create(product_id: product.id) unless likes.exists?(product_id: product.id)
  end
end
