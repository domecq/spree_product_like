Spree::Product.class_eval do
  has_many :likes
  scope :likes_ranking, ->{ joins(:likes).order('likes_count DESC') }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
