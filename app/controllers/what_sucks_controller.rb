class WhatSucksController < ApplicationController
  autocomplete_for :project, :name
  def index
  end

  def create
    issue_name = params["what-text"].capitalize
    ticket_exists = (Uservoice_ticket.all.map {|ticket| ticket.subject}).include?(params["what-text"].capitalize)
    if !ticket_exists
      Uservoice_ticket.poll_uservoice
    end
    if issue_name == "" or issue_name == nil
      flash[:notice] = "Please enter 1-2 words about what sucks!"
      redirect_to "/" and return
    else
      issue = Issue.new
      issue_name = params["what-text"].gsub(" ", "%20").capitalize
      redirect_to "/end_user_index/#{issue_name}"
    end
  end
end
