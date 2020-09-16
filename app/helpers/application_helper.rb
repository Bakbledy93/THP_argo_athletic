module ApplicationHelper

  def customer_card_id
    Stripe::Customer.retrieve(current_user.stripe_id).default_source
  end

  def customer_card_details
    Stripe::Customer.retrieve_source(current_user.stripe_id, Stripe::Customer.retrieve(current_user.stripe_id).default_source,)
  end

  def customer_subscription
    Stripe::Subscription.retrieve(current_user.sub_id)
  end

  def customer_subscription_time
    Time.at(customer_subscription.start_date,in: "+01:00").strftime("%d/%m/%Y")
  end

  def customer_subscription_price
    customer_subscription.plan.amount
  end

end
