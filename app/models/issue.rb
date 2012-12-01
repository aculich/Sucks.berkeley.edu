require 'pivotal-tracker'
require 'uservoice-ruby'
require 'oauth'

class Issue < ActiveRecord::Base
  # attr_accessible :action, :date_entered, :goal, :name, :identity_tags
  has_many :comments
  belongs_to :project
  attr_accessible :name, :pivotal_issue_id, :link_to_uservoice, :date_entered, :votes, :action, :as_a, :so_that, :i_want, :project_id, :progress
  
  def get_progress()
  	PivotalTracker::Client.token = GlobalConstants::CLIENT_TOKEN
	pivotal_proj = PivotalTracker::Project.all.select {|x| x.name == name}[0]
	pivotal_issue = pivotal_proj.stories.all.select{|x| x.id == pivotal_issue_id}[0]
	pivotal_progress = pivotal_issue.current_state()
	if pivotal_progress == "unscheduled" or pivotal_progress == "unstarted"
	  return "submitted"
	elsif 
	  pivotal_progress == "finished"
	  return "completed"
	else
	  return "in progress"
	end
  end

  def get_pivotal_id()
    return project.pivotal_tracker_id
  end

end
