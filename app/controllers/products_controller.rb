class ProductsController < ApplicationController
  def index
      @products = Product.all
  end

  def product
    @product = Product.find(params[:id])
  end

  def new_products
    @new_products = Product.where("created_at >= ?", 2.days.ago.utc)
  end

  def updated_products
    @updated_products = Product.where("updated_at >= ?", 2.days.ago.utc)
  end
end
