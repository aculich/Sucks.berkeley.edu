class WhatActionController < ApplicationController
  def show
    issue = Issue.find_by_id(params[:issue_id])
    @issue_name = issue.name
    if params[:put]
      issue_id = params[:issue_id]
      issue_action = params[:put][:issue_action]
      if issue_action == "" or issue_action == nil
        flash[:notice] = "Please answer the question!"
        redirect_to "/action/#{issue_id}"
      else
        issue = Issue.find_by_id(params[:issue_id])
        issue.action = params[:put][:issue_action]
        issue.save
        redirect_to "/goal/#{issue_id}"
      end
    end
  end
end
