=begin
class WhatGoalController < ApplicationController
  def index
  end
  def show
    issue = Issue.find_by_id(params[:issue_id])
    @issue_name = issue.name
    @issue_action = issue.action
    if request.post?
      issue_id = params[:issue_id]
      issue_goal= params["what-text"]
      if issue_goal == "" or issue_goal == nil
        flash[:notice] = "Please answer the question!"
        redirect_to "/goal/#{issue_id}" and return
      else
        issue = Issue.find_by_id(params[:issue_id])
        issue.goal = params["what-text"]
        issue.save
        redirect_to "/identity/#{issue_id}" and return
      end
    end
  end
end
=end
