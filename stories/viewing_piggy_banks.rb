require File.expand_path(File.dirname(__FILE__) + "/helper")

with_steps_for :piggy_banks, :type => RailsStory do
  run 'stories/viewing_piggy_banks', :type => RailsStory
end

