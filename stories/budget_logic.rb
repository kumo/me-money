require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :budgets, :type => RailsStory do
  run 'stories/budget_logic', :type => RailsStory
end

