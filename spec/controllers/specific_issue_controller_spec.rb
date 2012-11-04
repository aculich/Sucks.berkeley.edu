require "spec_helper"

describe SpecificIssueController do


  

  describe "Clicking on the submit button with parameters filled out" do
    it "should link to the issue_info with i_want and so_that parameters" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, "want-text" => "I want candy", "so-text" => "cavities", :method => "put"
      response.should redirect_to("/issue_info/#{issue.name}")
    end
  end

  describe "clicking on the submit button with no i_want parameter entered" do
    it "should redirect to itself with so_that parameter and flash error message" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, "want-text" => "", "so-text" => "cavities", :method => "put"
      response.should redirect_to("/specific_issue/#{issue.name}")
    end
  end

  describe "clicking on submit button with no so_that parameter entered" do
    it "should redirect to itself with i_want parameter and flash error message" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, "want-text" => "I want candy", "so-text" => "", :method => "put"
    end
  end
end
