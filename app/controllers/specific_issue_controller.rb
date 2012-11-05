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
			  redirect_to "/specific_issue/#{@issue_name}"
		  elsif so_that == "" or so_that == nil
			  flash[:notice] = "Please tell us why you want this feature!"
			  redirect_to "/specific_issue/#{@issue_name}"
		  else
	      issue_id = Issue.create!({"name"=>params["issue_name"], 
					     "i_want"=>i_want, 
					     "so_that"=>so_that, 
					     "votes"=>0,
					     "date_entered"=>Time.now}).id
		    redirect_to "/issue_info/#{issue_id}"
      end
    end
  end
end

