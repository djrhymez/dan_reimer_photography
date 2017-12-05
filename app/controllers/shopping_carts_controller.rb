class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :check_customer, only: [:index]

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

    session[:products_in_cart] = @products_in_cart
    @cart_subtotal = session[:cart_subtotal]

    client = Client.where('user_id = ?', current_user.id).first
    province = client.province

    pst_rate = province.pst
    gst_rate = province.gst
    hst_rate = province.hst

    @pst = @cart_subtotal * pst_rate
    @gst = @cart_subtotal * gst_rate
    @hst = @cart_subtotal * hst_rate

    @total = @cart_subtotal + @pst + @gst + @hst
    session[:total] = @total
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
    client = Client.where('user_id = ?', current_user.id).first

    if client == nil
      client = Client.new
      client.user_id = current_user.id
      default_province = Province.where('id = ?', 3).first
      client.province = default_province
      client.save
    end

    client = Client.where('user_id = ?', current_user.id).first
    session[:client] = client;

    if client.address == nil
      redirect_to update_address_url
    end
  end

  def update_address
    @provinces = Province.all
  end

  def save_address
    client = Client.where('user_id = ?', current_user.id).first
    client_address = params[:client_address]
    client_province = params[:client_province]

    client.address = client_address
    client.province_id = client_province.to_i
    client.save

    redirect_to shopping_cart_url
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
