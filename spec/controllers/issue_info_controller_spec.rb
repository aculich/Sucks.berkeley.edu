require "spec_helper"

describe IssueInfoController do
  describe "Arriving on issue info page" do
    it "should contain issue details" do
      issue = Issue.create()
      issue.name = "Airbears"
      Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
      get :show, :issue_id => issue.id
      assigns(:issue_name).should == "Airbears"
    end
  end

  describe "Arriving on issue info page with vote parameter" do
    it "should increase the vote by one" do
      issue = Issue.create()
      issue.name = "Airbears"
      issue.votes = 0
      Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
      get :show, :issue_id => issue.id, :vote => "true"
      issue.votes.should == 1
    end

    it "should call add pivotal story" do
      issue = Issue.create()
      issue.name = "Airbears"
      issue.votes = 2
      Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
      Project.should_receive(:add_issue_to_pivotal)
      get :show, :issue_id => issue.id, :vote => "true"
      issue.votes.should == 3
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
