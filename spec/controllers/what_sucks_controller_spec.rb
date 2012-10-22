require "spec_helper"

describe WhatSucksController do
#  describe "Typing in the textbox field" do
#    it "should look up values for field autocomplete and create JS Array" do
#    end
#  end

  describe "Clicking on the submit button" do
    it "should link to the what_action with name parameter" do
      issue = Factory(:issue, :name = "Test"), :issue_id => issue.id
      response.should redirect_to("/action/#{issue_id}"
    end
  end

  describe "clicking on the submit button with no name parameter entered" do
    it "should redirect to itself and flash and error message" do
      issue = Factory(:issue, :name = "Test"), :issue_id => issue.id
      response.should redirect_to("/sucks/index")
    end
  end
end
