require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :piggy_banks, :budgets, :type => RailsStory do
  run 'stories/saving_up', :type => RailsStory
end

