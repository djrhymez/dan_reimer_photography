class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_categories, only: [:index, :products_by_category]

  private

  def get_categories
      @categories = Category.all
  end
end
