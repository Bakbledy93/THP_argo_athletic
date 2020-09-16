module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      redirect_to(admins_path) and return
    elsif current_user
      flash.clear
      redirect_to (user_path(current_user.id)) and return
    end
  end
end