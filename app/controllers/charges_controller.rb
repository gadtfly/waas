class ChargesController < ApplicationController

  def new
    render layout: 'pages'
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'current_user.email',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    current_user.update_attributes(role: :premium)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path

    render layout: 'pages'
  end


end