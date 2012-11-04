require "spec_helper"

describe EndUserIndexController do

  describe "Clicking on the submit button with your issue filled out" do
    it "should link to specific_issue with issue parameter filled out" do
      issue = Issue.create()
      #post :show, :issue_id => issue.id, "what-text" => "bear", :method => "put"
      response.should redirect_to("/specific_issue/#{issue.name}")
    end
  end

  describe "Clicking on one of the given Pivotal Tracker or User Voice issues" do
    it "should link to specific_issue with issue parameter filled out" do
      response.should redirect_to("/specific_issue/#{issue.name}")
    end
  end

  describe "clicking on the submit button with no issue parameter entered" do
    it "should redirect to itself and flash and error message" do
      issue = Issue.create()
      #post :show, :issue_id => issue.id, :method => "put", "what-text" => ""
      response.should redirect_to("/end_user_index/index")
    end
  end
end
