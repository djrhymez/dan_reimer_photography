class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!, only: [:checkout]
  before_action :check_customer, only: [:checkout]

  def index
    @products_in_cart = Product.find(session[:shopping_cart].keys)
    session[:cart_subtotal] = 0;

    @products_in_cart = []

    session[:shopping_cart].each do |product, quantity|
      price = Product.find(product).price
      cart_item = CartItem.new(product, quantity, price)
      session[:cart_subtotal] += cart_item.quantity * cart_item.price
      @products_in_cart << cart_item
    end

    @cart_subtotal = session[:cart_subtotal]
  end

  def add_to_cart
    session[:shopping_cart][params[:id]] ||= 0
    session[:shopping_cart][params[:id]] += 1

    redirect_to home_url
  end

  def increase_item_quantity
    session[:shopping_cart][params[:id]] += 1
    redirect_to shopping_cart_url
  end

  def decrease_item_quantity
    session[:shopping_cart][params[:id]] -= 1

    if session[:shopping_cart][params[:id]] == 0
      remove_from_cart
    else
      redirect_to shopping_cart_url
    end
  end

  def remove_from_cart
    session[:shopping_cart].except!(params[:id])
    redirect_to shopping_cart_url
  end

  def checkout

  end

  def check_customer
    client = Client.where('user_id = ?', current_user.id)

    if client.empty?
      client = Client.new
      client.user_id = current_user.id
      client.save
    end

    client = Client.where('user_id = ?', current_user.id).first
    session[:client] = client;

    if client.address == nil
      redirect_to update_address_url
    else
      # redirect_to checkout_url
    end
  end

  def update_address
  end

  def save_address

  end

  class CartItem
    attr_accessor :id, :quantity, :name, :price

    def initialize(id, quantity, price)
        @id = id
        @quantity = quantity
        @name = Product.find(id).name
        @price = price
    end
  end
end
