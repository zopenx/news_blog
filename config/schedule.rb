
set :environment, 'development'
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :path, "/home/oem/news_blog"
set :output, "log/cron_log.log"

# 
# every 1.minute do
#   # runner UserMailer.daily_send
#   runner "UserMailer.send_for_day", :output => 'log/cron_log.log'
# end

every 1.day, at: '07:00am' do
  # runner UserMailer.daily_send
  runner "UserMailer.send_for_day", :output => 'log/cron_log.log'
end

every :monday, at: '07:00am' do
  # runner UserMailer.daily_send
  runner "UserMailer.send_for_week", :output => 'log/cron_log.log'
end
