class ShopperController < ApplicationController
  include(CurrentCart)
  before_action :set_cart

  def index
    @allproducts = Product.order(:name)
  end

  def show_product
    @product = Product.find(params[:id])
  end
end
