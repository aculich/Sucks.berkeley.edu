class IssuesController < ApplicationController
  def index
    @issues = Issue.all(:order => "votes DESC")
  end
end
