require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :accounts, :entries, :type => RailsStory do
  run 'stories/dashboard', :type => RailsStory
end

