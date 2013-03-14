


Given(/^I have class/) do
  @class = Class.new do
    extend Rails::Easy::Finder
  end
end

When(/^I define a finder for "(.*?)" calling it "(.*?)"$/) do |finder_class,finder_method|
  @class.class_eval do
    define_finder finder_method.to_sym do
      send "finds_#{finder_class}"
    end
  end
end

Then(/^an instance of the class should have a "(.*?)" method$/) do |finder_method|
  @instance = @class.new
  @result = @instance.send(finder_method.to_sym)
end

Then(/^it should produce some kind of results$/) do
  pending # express the regexp above with the code you wish you had
end
