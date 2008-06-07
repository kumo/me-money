ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/rails/story_adapter'

# story steps
Dir[File.join(File.dirname(__FILE__), "steps/*.rb")].each do |file|
  require file
end