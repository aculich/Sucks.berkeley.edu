class WhatSucksController < ApplicationController
  def index
  end

  def create
    issue_name = params["what-text"]
    if issue_name == "" or issue_name == nil
      flash[:notice] = "Please enter 1-2 words about what sucks!"
      redirect_to "/" and return
    else
      issue = Issue.new
      issue_name = params["what-text"].gsub(" ", "%20")
      redirect_to "/end_user_index/#{issue_name}"
    end
  end
end
