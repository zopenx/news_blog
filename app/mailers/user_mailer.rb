class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'
  # class << self
  default from: 'ruby_test_account@mail.ru'
  def welcome_email
    @admin = params[:admin]
    @url  = 'http://localhost:3000/'
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end

  def daily_send
    Admin.all.each do |admin|
      mail(to: admin.email, subject: 'Welcome to My Awesome Site')
    end
  end


end
