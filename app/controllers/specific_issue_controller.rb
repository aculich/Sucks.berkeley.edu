class SpecificIssueController < ApplicationController

  def index
  end

  def show
    @issue_name = params[:issue_name]
    if request.post?
	i_want = params["want-text"]
	so_that = params["so-text"]
	if i_want == "" or i_want == nil
	  flash[:notice] = "Please tell us what you want!"
	  redirect_to "/specific_issue/#{issue_name}"
        if so_that == "" or so_that == nil
	  flash[:notice] = "Please tell us why you want this feature!"
	  redirect_to "/specific_issue/#{issue_name}"
	else
	  issue = Issue.find_by_id(params[:issue_id])
	  issue.i_want = params["want-text"]
	  issue.so_that = params["so-text"]
	  issue.save
   	  redirect_to "/issue_info/#{issue_name}"
	end
    end
  end
  
end

