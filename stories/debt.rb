require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :debts, :type => RailsStory do
  run 'stories/debt', :type => RailsStory
end

