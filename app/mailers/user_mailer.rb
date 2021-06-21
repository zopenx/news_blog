class UserMailer < ApplicationMailer

  default from: 'ruby_test_account2@mail.ru'

  def welcome_email
    @admin = params[:admin]
    @url  = 'http://localhost:3000/'
    mail(to: @admin.email, subject: 'Добро пожаловать на http://localhost:3000/')
  end

  def daily_posts
    @admin = params[:admin]
    @url  = 'http://localhost:3000/'
    @posts = params[:posts]
    @days_count = params[:days_count]
    @title_mail = params[:title_mail]
    # @posts = Post.where("created_at >?", DateTime.now.ago(1.day)).all
    mail(to: @admin.email, subject: @title_mail)
  end

  def self.send_for_day
    ApplicationController.admis_by_day.each do |adm|
      @admin = adm
      @posts = PostsController.new_post_by_day
      @days_count = "последний день"
      @title_mail = 'Новые посты за день'
      UserMailer.with(admin: @admin, posts: @posts, days_count:@days_count, title_mail:@title_mail).daily_posts.deliver_now
    end
  end

  def self.send_for_week
    ApplicationController.admis_by_week.each do |adm|
      @admin = adm
      @posts = PostsController.new_post_by_week
      @days_count = "последнюю неделю"
      @title_mail = 'Новые посты за неделю'
      UserMailer.with(admin: @admin, posts: @posts, days_count:@days_count, title_mail:@title_mail).daily_posts.deliver_now
    end
  end


end
