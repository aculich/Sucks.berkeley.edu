class SpecificUserIndexController < ApplicationControllers

  def index
  end

  def show
    issue_name = params["what-issue"]
    issues = Issue.filter_by_name(:issue_name)
  end
  
end
