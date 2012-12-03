Then /^I should see the discussion panel$/ do
  step "I should see \"Discussion\""
end

Then /^I submit a comment with name "(.*?)" and comment "(.*?)"$/ do |arg1, arg2|
  step "I fill in \"put_commenter_name\" with \"#{arg1}\""
  step "I fill in \"put_comment_text\" with \"#{arg2}\""
end

Then /^I should see my comment displayed with name "(.*?)" and comment "(.*?)"$/ do |arg1, arg2|
  step "I should see \"#{arg1}\""
  step "I should see \"#{arg2}\""
end

