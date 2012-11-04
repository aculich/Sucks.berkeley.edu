class EndUserIndexController < ApplicationController

  def index
  end

  def show
    issue_name = params[:issue_name]
    @issues = Issue.find_all_by_name(issue_name)
  end
  
end
