class IssueInfoController < ApplicationController

  def index
  end

  def show
    @issue_name = Issue.find_by_id(params[:issue_id]).name
    #@comment = Issue.comment.where(:issue_name => @issue_name)
  end

end
