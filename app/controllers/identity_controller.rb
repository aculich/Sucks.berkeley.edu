class IdentityController < ApplicationController
  def index
  end
  def show
    issue = Issue.find_by_id(params[:issue_id])
    @issue_id = issue.id
    @issue_name = issue.name
    @issue_action = issue.action
    @issue_goal = issue.goal
    if request.post?
      issue_id = params[:issue_id]
      identity = params["what-text"]
      if identity == "" or identity == nil
        flash[:notice] = "Please choose an identity!"
        redirect_to "/identity/#{issue_id}" and return
      else
        issue = Issue.find_by_id(params[:issue_id])
        identity = params["what-text"]
        issue.identity_tags = identity
        issue.save
        redirect_to "/summary/#{issue_id}"
      end
    end
  end
end
