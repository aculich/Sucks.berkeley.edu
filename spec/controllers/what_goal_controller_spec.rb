=begin
require "spec_helper"

describe WhatGoalController do
#  describe "Typing in the text box" do
#    it "should look up values for field autocomplete and create JS Array" do
#    end
#  end
  
  describe "Clicking on submit with parameters filled out" do
    it "should link to identity page with name, action, goal parameter" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, "what-text" => "finished 169 hw", :method => "put"
      response.should redirect_to("/identity/#{issue.id}")
    end
  end

  describe "Clicking on submit with no goal parameter entered" do
    it "should redirect to itself with name, action parameter and flash error message" do
      issue = Issue.create()
      new_id = issue.id + 1
      post :show, :issue_id => issue.id, :method => "put", "what-text" => ""
      response.should redirect_to("/goal/#{issue.id}")
    end
  end
end
=end
