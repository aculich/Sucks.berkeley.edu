class SpecificIssueController < ApplicationController

  def index
  end

  def show
    @issue_name = params[:issue_name]
    if params[:uservoice_url] != nil
      @uservoice_url = params[:uservoice_url]
    end
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
        if Project.find_all_by_name(params["issue_name"]).empty?
          Project.create_pivotal_project(params["issue_name"])
        end
        found_proj = Project.find_by_name(params["issue_name"])
        new_issue = found_proj.issues.build({"name"=>params["issue_name"], 
				     "i_want"=>i_want, 
				     "so_that"=>so_that, 
				     "votes"=>0,
				     "date_entered"=>Time.now})
        if params[:uservoice_url] != nil
          new_issue.link_to_uservoice = params[:uservoice_url]
        end
        new_issue.save
        redirect_to "/issue_info/#{new_issue.id}"
      end
    end
  end
end

