class SpecificIssueController < ApplicationController

  def index
  end

  def show
    debugger
    @issue_name = params[:issue_name]
	i_want = params["want-text"]
	so_that = params["so-text"]
	
	if request.post?
		if i_want == "" or i_want == nil
			flash[:notice] = "Please tell us what you want!"
			redirect_to "/specific_issue/#{issue_name}"
		end
		
		if so_that == "" or so_that == nil
			flash[:notice] = "Please tell us why you want this feature!"
			redirect_to "/specific_issue/#{issue_name}"
		end
	
		issue_id = Issue.create!({"name"=>params["issue_name"], 
					   "i_want"=>i_want, 
					   "so_that"=>so_that, 
					   "votes"=>0}).id
		redirect_to "/issue_info/#{issue_id}"
	
	else
		issues = Issue.find_all_by_name(@issue_name)
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

