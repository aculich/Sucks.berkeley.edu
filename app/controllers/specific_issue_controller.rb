class SpecificIssueController < ApplicationController

  def index
  end

  def show
    issue_name = params["what-issue"]
    issues = Issue.find_all_by_name(:issue_name)
  end
  
end
