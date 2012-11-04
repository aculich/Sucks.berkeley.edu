class IssueInfoController < ApplicationControllers

  def index
  end

  def show
    @issue_name = params["issue_name"]
    @comment = Issue.comment.where(:issue_name => @issue_name)
  end

end
