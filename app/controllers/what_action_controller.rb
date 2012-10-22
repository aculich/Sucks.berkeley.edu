class WhatActionController < ApplicationController
  def show
    issue = Issue.find_by_id(params[:issue_id])
    @issue_name = issue.name
    if request.post?
      issue_id = params[:issue_id]
      issue_action = params["what-text"]
      if issue_action == "" or issue_action == nil
        flash[:notice] = "Please answer the question!"
        redirect_to "/action/#{issue_id}" and return
      else
        issue = Issue.find_by_id(params[:issue_id])
        issue.action = params["what-text"]
        issue.save
        redirect_to "/goal/#{issue_id}" and return
      end
    end
  end
end
