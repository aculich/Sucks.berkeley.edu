# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

issues = [{:name => 'KevinYao', :action => 'talking to him', :date_entered => '25-Nov-1992', :votes => 0, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to fail him'},
		  {:name => 'Airbears', :action => 'Watching Hulu', :date_entered => '25-Dec-2001', :votes => 0, :as_a => 'student', :so_that => 'I can watch hulu', :i_want => 'to get internet access'},
		  {:name => 'TiffanyJianto', :action => 'breaking her chair', :date_entered => '3-Nov-2012', :votes => 0, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to fail her'},
		  {:name => 'AshleySun', :action => 'buying bagels', :date_entered => '2-Apr-1992', :votes => 0, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to pass her'},
		  {:name => 'DougDavies', :action => 'sitting', :date_entered => '25-Nov-2045', :votes => 0, :as_a => '169 TA', :so_that => 'I can do my job', :i_want => 'to pass him'},
		  {:name => 'Telebears', :action => 'signing up for classes', :date_entered => '1-Feb-2011', :votes => 0, :as_a => 'administrator', :so_that => 'mess with students', :i_want => 'to make telebears suck'},
  	 ]

issues.each do |issue|
  Issue.create!(issue)
end
