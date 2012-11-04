class SpecificIssueController < ApplicationController

  def index
  end

  def show
    @issue_name = params[:issue_name]
  end
  
end
