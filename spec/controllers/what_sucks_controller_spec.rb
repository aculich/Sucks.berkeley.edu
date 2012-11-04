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
      post :create, "what-text" => "asdf", :method => "put"
      response.should redirect_to("/end_user_index/#{new_id}")
    end
  end

  describe "clicking on the submit button with no name parameter entered" do
    it "should redirect to itself and flash and error message" do
      post :create, :method => "put", "what-text" => ""
      response.should redirect_to("/what_sucks/index")
    end
  end
end
