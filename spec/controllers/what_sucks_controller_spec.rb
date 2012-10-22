require "spec_helper"

describe WhatSucksController do
#  describe "Typing in the textbox field" do
#    it "should look up values for field autocomplete and create JS Array" do
#    end
#  end

  describe "Clicking on the submit button" do
    it "should link to the what_action with name parameter" do
      issue = Issue.create()
      new_id = issue.id + 1
      post :create, :put => {"issue_name" => "asdf"}, :method => "put"
#      response.body.should include "Sucks!"
#      response.body.should include issue.name
      response.should redirect_to("/action/#{new_id}")
    end
  end

  describe "clicking on the submit button with no name parameter entered" do
    it "should redirect to itself and flash and error message" do
      issue = Issue.create()
      post :create, :method => "put", :put => {"issue_name" => ""}
#     response.body.should include "Sucks!"
      response.should redirect_to("/what_sucks/index")
    end
  end
end
