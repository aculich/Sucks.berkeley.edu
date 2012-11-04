=begin
class SummaryController < ApplicationController
  def index
  end
  def show
    issue = Issue.find_by_id(params[:issue_id])
    @issue_id = issue.id
    @issue_name = issue.name
    @issue_action = issue.action
    @issue_goal = issue.goal
    @issue_identity = issue.identity_tags
  end
end
=end
