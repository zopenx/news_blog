class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?
   after_action :try_mails_sent, only: %i[create]
  protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :send_types_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def self.admis_by_day
    @admis = Admin.where("send_types_id =?", 1).all
  end

  def self.admis_by_week
    @admis = Admin.where("send_types_id =?", 2).all
  end

  private
  def try_mails_sent
    UserMailer.with(admin: @admin).welcome_email.deliver_later
  end
end
