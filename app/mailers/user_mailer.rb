class UserMailer < ApplicationMailer

  default from: 'ruby_test_account@mail.ru'

  def welcome_email
    @admin = params[:admin]
    @url  = 'http://localhost:3000/'
    mail(to: @admin.email, subject: 'Welcome to My Awesome Site')
  end

  def self.send_for_day
    Admin.all.each do |adm|
      @admin = adm
      UserMailer.with(admin: @admin).welcome_email.deliver_now
    end
  end

  def self.send_for_week
    Admin.all.each do |adm|
      @admin = adm
      UserMailer.with(admin: @admin).welcome_email.deliver_now
    end
  end

end
