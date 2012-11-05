class IssueInfoController < ApplicationController

  def index
  end

  def show
    @issue = Issue.find_by_id(params[:issue_id])
    @issue_name = @issue.name
	if params["vote"] == "true"
		@issue.votes += 1
		@issue.save!
	end
    #@comment = Issue.comment.where(:issue_name => @issue_name)
  end

end
