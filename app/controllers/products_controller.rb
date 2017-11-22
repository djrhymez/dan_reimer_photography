class ProductsController < ApplicationController
  def index
      @products = Product.order(:updated_at).all
  end

  def product
    @product = Product.find(params[:id])
  end

  def new_products
    @new_products = Product.where("created_at >= ?", 2.days.ago.utc).order(:created_at)
  end

  def updated_products
    @updated_products = Product.where("updated_at >= ?", 2.days.ago.utc).order(:updated_at)
  end

  def search_results
    wildcard_keywords = '%' + params[:search_keywords] + '%'

    if params[:category].to_i == 0
      @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords)
    else
      @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_keywords, wildcard_keywords).where('category_id = ?', params[:category].to_i)
    end
  end

  def products_by_category
    @category = Category.find(params[:category]).name
    @products = Category.find(params[:category]).products
  end
end
