# Add a declarative step here for populating the DB with movies.

Then /^I click on the first issue$/ do
  find(:css, "html > body > section > div#center-container > div#content-container > div#issues-table > div#faux-th > a").click
end