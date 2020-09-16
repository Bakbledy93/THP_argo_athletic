module ApplicationHelper

  def customer_card_id
    Stripe::Customer.retrieve(current_user.stripe_id).default_source
  end

  def customer_card_details
    Stripe::Customer.retrieve_source(current_user.stripe_id, Stripe::Customer.retrieve(current_user.stripe_id).default_source,)
  end

end
