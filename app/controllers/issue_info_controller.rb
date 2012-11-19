class IssueInfoController < ApplicationController

  def index
  end

  def show
    @issue = Issue.find_by_id(params[:issue_id])
    @issue_name = @issue.name
    if params["vote"] == "true"
      @issue.votes += 1
      Project.add_issue_to_pivotal(@issue)             
		  @issue.save!
    end
    if request.post?
      RequestMailer.send_request(params[:name], params[:email], params[:pid], params[:issue_id]).deliver
      @notice = "Your request has been sent"
    end
    #@comment = Issue.comment.where(:issue_name => @issue_name)
  end

end
