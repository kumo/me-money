require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :budgets, :piggy_banks, :type => RailsStory do
  run 'stories/creating_budget', :type => RailsStory
end

