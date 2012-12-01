# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


PivotalTracker::Client.token = GlobalConstants::CLIENT_TOKEN

pivotal_projects = PivotalTracker::Project.all

pivotal_projects.each do |pivotal_project|
  Project.create_pivotal_project(pivotal_project.name)
end

issues = [{:name => 'Telebears', :action => 'signing up for classes', :date_entered => '25-Nov-1992', :votes => 2, :as_a => 'fourth year undergraduate student', :so_that => 'I can get into a class I need to graduate in four years', :i_want => 'Telebears not to crash'},
		  {:name => 'Airbears', :action => 'sitting in lecture', :date_entered => '25-Dec-2001', :votes => 1, :as_a => 'EECS student', :so_that => 'I can download lecture notes', :i_want => 'to get internet access in Soda Hall during lecture'},
		  {:name => 'schedule.berkeley.edu', :action => 'creating a schedule for next semester', :date_entered => '3-Nov-2012', :votes => 1, :as_a => 'incoming freshman', :so_that => 'i can more easily create my first-semester schedule ', :i_want => 'to be able to view courses that satisfy my major and that are available'},
		  {:name => 'bspace', :action => 'studying for midterm', :date_entered => '2-Apr-1992', :votes => 2, :as_a => 'student in Anthro 160AC', :so_that => 'I can quickly download an entire semesters worth of lecture notes', :i_want => 'to be able to checkmark multiple files to download at one time'},
		  {:name => 'piazza', :action => 'submitting iteration 3-2', :date_entered => '25-Nov-2045', :votes => 2, :as_a => 'CS169 student', :so_that => 'my entire group can view and edit our Piazza post', :i_want => 'to be able to share private Piazza posts with multiple students'},
		 ]

issues.each do |issue|
  found_proj = Project.find_by_name(issue[:name])
  new_issue = found_proj.issues.build({
    "name"=>issue[:name], 
    "i_want"=>issue[:i_want], 
    "so_that"=>issue[:so_that], 
	"votes"=>issue[:votes],
	"date_entered"=>Time.now
	})
  new_issue.save
  Project.add_issue_to_pivotal(new_issue)
end

daterecords = [{:name => 'UservoiceDate', :dt => '2012-12-01 08:00:00' }]

Uservoice_ticket.poll_uservoice()
