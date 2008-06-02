require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :piggy_banks, :type => RailsStory do
  run 'stories/piggy_bank', :type => RailsStory
end

