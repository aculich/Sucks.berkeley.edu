class WhatSucksController < ApplicationController
  def index
  end

  def create
    issue_name = params["what-text"]
    if issue_name == "" or issue_name == nil
      flash[:notice] = "Please enter 1-2 words about what sucks!"
      redirect_to "/what_sucks/index" and return
    else
      issue = Issue.new
      issue.name = params["what-text"]
      issue.save
#      redirect_to "/action/#{issue.id}" and return
      redirect_to "/end_user_index/#{issue_name}"
    end
  end
end
