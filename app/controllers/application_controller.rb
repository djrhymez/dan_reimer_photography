class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_categories, only: [:index, :products_by_category, :search_results, :new_products, :updated_products]
  before_action :initialize_session

  private

  def initialize_session
    session[:shopping_cart] ||= {}
  end

  def get_categories
      @categories = Category.all
  end
end
