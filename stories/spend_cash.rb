require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :accounts, :type => RailsStory do
  run 'stories/spend_cash', :type => RailsStory
end

