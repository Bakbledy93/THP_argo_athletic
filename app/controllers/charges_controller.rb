class ChargesController < ApplicationController

  before_action :authenticate_user!

  @@plan_id = ""
  def index
    @user=current_user.email
  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card 
    @params = params[:plan_id]
    @plan_id = params[:plan_id]
    @@plan_id = @plan_id
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email}) 
        #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email. 
        current_user.update(:stripe_id => customer.id)
        #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
      end

      card_token = params[:stripeToken]
      #it's the stripeToken that we added in the hidden input
      if card_token.nil?
       redirect_to request.referrer, error: "Oops"
      end
      #checking if a card was giving.

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      #we're attaching the card to the stripe customer
      customer.save
      if @params = @plan_id
        subscribe
      else
      redirect_to request.referrer
    end
  end

  def destroy
  end

  def delete_card
    puts     Stripe::Customer.retrieve(current_user.stripe_id).default_source
    Stripe::Customer.delete_source(
      current_user.stripe_id,
      Stripe::Customer.retrieve(current_user.stripe_id).default_source,
    )
    redirect_to edit_user_registration_path
  end

  def success
    @plans = Stripe::Plan.list.data
    @plan_1 = Stripe::Plan.retrieve(
      'price_1HRfEKJz7TPSTY9W03MPLnl9',
    )
  end

  def subscribe
    @plan_id = params[:plan_id]
    customer = Stripe::Customer.new current_user.stripe_id
    #we define our customer
    subscriptions = Stripe::Subscription.list(customer: customer.id)
    subscriptions.each do |subscription|
      subscription.delete
    end
    #we delete all subscription that the customer has. We do this because we don't want that our customer to have multiple subscriptions
    if @@plan_id.nil?
      @plan_id = params[:plan_id]
    else
      @@plan_id = @plan_id
    end
    subscription = Stripe::Subscription.create({
      customer: customer,
      items: [{plan: @plan_id}], })
    #we are creating a new subscription with the plan_id we took from our form
    current_user.update(:sub_id => subscription.id)
    subscription.save
    redirect_to root_path
  end

  def cancel_subscription
    Stripe::Subscription.delete(current_user.sub_id)
    current_user.update(:sub_id => nil)
    redirect_to edit_user_registration_path
  end

end
