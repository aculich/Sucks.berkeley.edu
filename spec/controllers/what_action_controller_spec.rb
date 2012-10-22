require "spec_helper"

describe WhatActionController do
#  describe "Typing in the textbox" do
#    it "should look up values for field autocomplete and #create JS Array" do
#    end
#  end

  describe "Clicking on submit" do
    it "should link to what_goal with name, action parameter" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, :put => {"issue_action" => "bear"}, :method => "put"
      response.should redirect_to("/goal/#{issue.id}")
    end
  end

  describe "Clicking on submit with no action parameter" do 
    it "should redirect to itself with name parameter and flash an error message" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, :method => "put", :put => {"issue_action" => ""}
      response.should redirect_to("/action/#{issue.id}")
    end
  end
end
