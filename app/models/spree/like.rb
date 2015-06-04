class Spree::Like < ActiveRecord::Base
  belongs_to :product, counter_cache: true
  belongs_to :user, :class_name => "Spree.user_class", :foreign_key => "user_id"

  attr_accessible :product_id, :user_id
  validates :user_id, uniqueness: { scope: :product_id }
end
