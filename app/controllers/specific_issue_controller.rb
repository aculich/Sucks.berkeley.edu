class SpecificIssueController < ApplicationController

  def index
  end

  def show
    @issue_name = params[:issue_name]
	
	if i_want == "" or i_want == nil
	  flash[:notice] = "Please tell us what you want!"
	  redirect_to "/specific_issue/#{issue_name}"
	end
	
	if so_that == "" or so_that == nil
	  flash[:notice] = "Please tell us why you want this feature!"
	  redirect_to "/specific_issue/#{issue_name}"
	end
	
	if request.post?
		Issue.create!({"name"=>params["issue_name"], 
					   "i_want"=>params["what-text"], 
					   "so_that"=>params["so-text"], 
					   "votes"=>0
					   "created_at"=>Time.now})
	
	else
		issue_name = params["what-issue"]
		issues = Issue.find_all_by_name(:issue_name)
=begin
these are comments:
	  issue = Issue.find_by_id(params[:issue_id])
	  issue.i_want = params["want-text"]
	  issue.so_that = params["so-text"]
	  issue.save!
   	  redirect_to "/issue_info/#{issue_name}"
=end
	end
  end
  
end

