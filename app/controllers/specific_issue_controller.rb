class SpecificIssueController < ApplicationController

  def index
  end

  def show
    debugger
	if request.post?
		Issue.create!({"name"=>params["issue_name"], 
					   "i_want"=>params["what-text"], 
					   "so_that"=>params["so-text"], 
					   "votes"=>0
					   "created_at"=>Time.now})
	else
		issue_name = params["what-issue"]
		issues = Issue.find_all_by_name(:issue_name)
	end
  end
  
end
