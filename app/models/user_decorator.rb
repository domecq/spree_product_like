User.class_eval do
  has_many :likes

  def like(product)
    self.likes.create(product: product) unless likes.exists?(product: product)
  end
end
