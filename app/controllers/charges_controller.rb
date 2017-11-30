class ChargesController < ApplicationController
  def new
    @amount_in_dollars = session[:total]
    @amount = @amount_in_dollars * 100 #amount in cents
    @amount = @amount.round(0)
    session[:stripe_amount] = @amount
    @description = "Your order of photos from Dan Reimer Photography."
    session[:stripe_description] = @description
  end

  def create
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => session[:stripe_amount],
    :description => 'Rails Stripe customer',
    :currency    => 'cad'
    )

    if charge.paid && charge.amount == session[:stripe_amount]

    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
