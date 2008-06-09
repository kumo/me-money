ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/rails/story_adapter'

# story steps
Dir[File.join(File.dirname(__FILE__), "steps/*.rb")].each do |file|
  require file
end

def parse_date(date)
  case date
    when "tomorrow" then Date.today + 1
    when "today" then Date.today
    when "yesterday" then Date.today - 1
    when /in ([0-9]+) days?/ then Date.today + $1.to_i
    when /([0-9]+) days? ago/ then Date.today - $1.to_i
    else Date.today
  end
end