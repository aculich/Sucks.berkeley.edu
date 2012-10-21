# Add a declarative step here for populating the DB with movies.

Given /the following issues exist/ do |issues_table|
  issues_table.hashes.each do |issue|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	Issue.new(issue)
	Issue.save!
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert /.*#{e1}.*#{e2}/m =~ page.body
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(/\,/)
  ratings.each do|r|
	if uncheck
		uncheck("ratings_"+r.gsub(/\s+/,""))
	else
		check("ratings_"+r.gsub(/\s+/,""))
	end
  end
end

Then /I should see all of the movies/ do
  assert page.all("table#movies tbody tr").count == Movie.count
end