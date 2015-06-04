require 'spec_helper'

describe Spree::LikesController do
  stub_authorization!
  let(:current_user) { create(:user) }
  let(:product) { create(:product) }

  describe '#like_product' do
    before { sign_in(current_user) }
    it 'current user likes a product' do
      spree_post 'like_product', id: product.id
      current_user.likes.map(&:product).should include(product)
    end
  end

  describe '#unlike_product' do
    before do
      sign_in(current_user)
      current_user.like(product)
    end
    it 'current user can unlike a product' do
      spree_post 'unlike_product', id: product.id
      current_user.reload.likes.map(&:product).should_not include(product)
    end
  end
end
