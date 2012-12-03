# Add a declarative step here for populating the DB with movies.

Given /^I see the story "(.*?)"$/ do |arg1|
  step "I should see \"#{arg1}\""
end