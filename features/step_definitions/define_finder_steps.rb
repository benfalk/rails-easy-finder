


Given(/^I have class/) do
  @class = Class.new do
    extend Rails::Easy::Finder
  end
end

When(/^I define a finder for "(.*?)"$/) do |finder|
  @class.class_eval do
    define_finder finder.to_sym do

    end
  end
end

Then(/^the class should have a "(.*?)" method$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^it should produce some kind of results$/) do
  pending # express the regexp above with the code you wish you had
end
