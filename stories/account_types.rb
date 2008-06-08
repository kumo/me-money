require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :accounts, :type => RailsStory do
  run 'stories/account_types', :type => RailsStory
end

