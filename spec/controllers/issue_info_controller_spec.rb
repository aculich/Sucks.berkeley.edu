require "spec_helper"

describe IssueInfoController do
  describe "Arriving on issue info page" do
    it "should contain issue details" do
      issue = Issue.create()
      issue.name = "Airbears"
      get :show, :issue_id => issue.id
      assigns(:issue).should == issue
    end
  end

  describe "Clicking on the submit question button" do
    it "should post clarificational question by developer" do
    end
  end

  describe "clicking on the submit comment button" do
    it "should post comment from other user" do
    end
  end
end
