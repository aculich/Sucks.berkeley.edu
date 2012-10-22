class WhatSucksController < ApplicationController
  def index
  end

  def create
    issue_name = params[:put][:issue_name]
    if issue_name == "" or issue_name == nil
      flash[:notice] = "Please enter 1-2 words about what sucks!"
      redirect_to "/what_sucks/index"
    else
      issue = Issue.new
      issue.name = params[:put][:issue_name]
      issue.save
      redirect_to "/action/#{issue.id}"
    end
  end
end
