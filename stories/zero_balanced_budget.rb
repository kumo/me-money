require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :budgets, :type => RailsStory do
  run 'stories/zero_balanced_budget', :type => RailsStory
end

