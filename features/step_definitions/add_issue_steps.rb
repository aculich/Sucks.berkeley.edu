# Add a declarative step here for populating the DB with movies.

Given /the following issues exist/ do |issues_table|
  issues_table.hashes.each do |issue|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	Issue.create!(issue)
  end
end

Then /^I should see only a text box followed by the word "(.*?)"$/ do |arg1|
  assert(find(:css,"#main-box>form>label").text == arg1)
end

When /^(?:|I )fill in the text box with "([^"]*)"$/ do |value|
  fill_in("what-text", :with => value)
end

Given /^I click the submit arrow$/ do
  click_button("submit_arrow")
end

Then /^I should see '([^']*)' at the top of the page$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I should see '(.*)' under that$/ do |text|
    if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Given /^(?:|I )am on (.+ page)$/ do |page_name|
  visit path_to(page_name)
end

Given /^(?:|I )am on (.+ for .+")$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am on Page 2 for "(.*?)" with the correct information displayed$/ do |issue_name|
  step "I am on Page 2 for the issue \"#{issue_name}\""
  step "I should see \'#{issue_name} Sucks!\' at the top of the page"
  step "I should see \"What were you doing when the problem occurred?\""
end

Given /^I am on Page 3 for "(.*?)" with the correct information displayed$/ do |issue_name|
  step "I am on Page 3 for the issue \"#{issue_name}\""
  step "I should see \'#{issue_name} Sucks!\' at the top of the page"
  step "I should see \"#{Issue.find_by_name(issue_name).action}\""
  step "I should see \"What was I doing:\""
  step "I should see \"What were you trying to accomplish?\""
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
