class WhatSucksController < ApplicationController
  def index
  end

  def create
    issue = Issue.new
    issue.name = params[:issue_name]
    issue.save
    redirect_to "/action/#{issue.id}"
  end
end
