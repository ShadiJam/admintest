class ChargesController < ApplicationController
  skip_before_filter :show_navbar, only: [:new]
  before_action :amount_to_be_charged
  before_action :authenticate_user!
  before_action :set_plan

  def thanks
  end

  def new
  end

  def create
    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description)

    redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end


  private

    def set_plan
      @plan = 9999
    end

    def description
      @description = "Some amazing product"
    end

    def amount_to_be_charged
      @amount = 2000
    end
end
