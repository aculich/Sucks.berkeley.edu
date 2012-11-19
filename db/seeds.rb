# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

projects_names = ['KevinYao', 'Airbears', 'TiffanyJianto', 'AshleySun', 'DougDavies', 'Telebears']

projects_names.each do |name|
  Project.create_pivotal_project(name)
end

issues = [{:name => 'KevinYao', :action => 'talking to him', :date_entered => '25-Nov-1992', :votes => 3, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to fail him'},
		  {:name => 'Airbears', :action => 'Watching Hulu', :date_entered => '25-Dec-2001', :votes => 4, :as_a => 'student', :so_that => 'I can watch hulu', :i_want => 'to get internet access'},
		  {:name => 'TiffanyJianto', :action => 'breaking her chair', :date_entered => '3-Nov-2012', :votes => 1, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to fail her'},
		  {:name => 'AshleySun', :action => 'buying bagels', :date_entered => '2-Apr-1992', :votes => 2, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to pass her'},
		  {:name => 'DougDavies', :action => 'sitting', :date_entered => '25-Nov-2045', :votes => 5, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to pass him'},
		  {:name => 'Telebears', :action => 'signing up for classes', :date_entered => '1-Feb-2011', :votes => 0, :as_a => 'administrator', :so_that => 'mess with students', :i_want => 'to make telebears suck'},
		 ]

issues.each do |issue|
  found_proj = Project.find_by_name(issue[:name])
  new_issue = found_proj.issues.build({
    "name"=>issue[:name], 
    "i_want"=>issue[:i_want], 
    "so_that"=>issue[:so_that], 
	"votes"=>0,
	"date_entered"=>Time.now
	})
  new_issue.save
  Project.add_issue_to_pivotal(new_issue)
end