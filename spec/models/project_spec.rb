require 'spec_helper'

describe Project do
  describe "create_pivotal_project" do
    it "should connect to pivotal tracker client" do
	  @mock1 = mock('PivotalTracker::Project')
	  @mock1.stub(:id).and_return(1)
	  @mock1.stub(:name).and_return("aaa")
	  @mock2 = mock('PivotalTracker::Project')
	  @mock2.stub(:id).and_return(2)
	  @mock2.stub(:name).and_return("fff")
	  @fake_results = [@mock1, @mock2]
	  PivotalTracker::Project.stub(:all).and_return(@fake_results)
	  Project.create_pivotal_project("fff")
    end
    it "should connect to pivotal tracker client" do
	  @mock1 = mock('PivotalTracker::Project')
	  @mock1.stub(:id).and_return(1)
	  @mock1.stub(:name).and_return("aaa")
	  @mock2 = mock('PivotalTracker::Project')
	  @mock2.stub(:id).and_return(2)
	  @mock2.stub(:name).and_return("fff")
	  @mock3 = mock('PivotalTracker::Project')
	  @mock3.stub(:id).and_return(3)
	  @fake_results = [@mock1, @mock2]
	  PivotalTracker::Project.stub(:all).and_return(@fake_results)
	  PivotalTracker::Client.token = GlobalConstants::CLIENT_TOKEN
	  @mockConnection = mock('RestClient::Resource')
	  @mockConnection.stub(:[]).and_return(@mockConnection)
	  @mockConnection.stub(:post).and_return(@mock3)
	  PivotalTracker::Project.stub(:parse).and_return(@mock3)
	  PivotalTracker::Client.stub(:connection).and_return(@mockConnection)
	  Project.create_pivotal_project("bbb")
    end
  end
  
  describe "add_issue_to_pivotal" do
    it "should do nothing when votes < 3" do
	  @mock1 = mock('Issue')
	  @mock1.stub(:id).and_return(1)
	  @mock1.stub(:name).and_return("aaa")
	  @mock1.stub(:votes).and_return(2)
	  @mock1.stub(:save).and_return(nil)
	  @mock1.should_receive(:save)
	  Project.add_issue_to_pivotal(@mock1)
    end
    it "should do stuff when votes >= 3... if as_a is nil" do
	  @mockIssue = mock('Issue')
	  @mockIssue.stub(:create).and_return(@mockIssue)
	  @mockIssue.stub(:id).and_return(1)
	  
	  @mock4 = mock('PivotalTracker::Project')
	  @mock4.stub(:id).and_return(1)
	  @mock4.stub(:name).and_return("aaa")
	  @mock4.stub(:stories).and_return(@mockIssue)
	  
	  @mock2 = mock('PivotalTracker::Project')
	  @mock2.stub(:id).and_return(2)
	  @mock2.stub(:name).and_return("fff")
	  
	  @fake_results = [@mock4, @mock2]
	  
	  PivotalTracker::Project.stub(:all).and_return(@fake_results)
	  
	  @mock1 = mock('Issue')
	  @mock1.stub(:id).and_return(1)
	  @mock1.stub(:name).and_return("aaa")
	  @mock1.stub(:votes).and_return(3)
	  @mock1.stub(:as_a).and_return("yoyo")
	  @mock1.stub(:i_want).and_return("I want")
	  @mock1.stub(:so_that).and_return("so that")
	  @mock1.stub(:as_a).and_return(nil)
	  @mock1.should_receive(:pivotal_issue_id=)
	  @mock1.should_receive(:save)
	  
	  Project.add_issue_to_pivotal(@mock1)
    end
	it "should do stuff when votes >= 3... if as_a is NOT nil" do
	  @mockIssue = mock('Issue')
	  @mockIssue.stub(:create).and_return(@mockIssue)
	  @mockIssue.stub(:id).and_return(1)
	  
	  @mock4 = mock('PivotalTracker::Project')
	  @mock4.stub(:id).and_return(1)
	  @mock4.stub(:name).and_return("aaa")
	  @mock4.stub(:stories).and_return(@mockIssue)
	  
	  @mock2 = mock('PivotalTracker::Project')
	  @mock2.stub(:id).and_return(2)
	  @mock2.stub(:name).and_return("fff")
	  
	  @fake_results = [@mock4, @mock2]
	  
	  PivotalTracker::Project.stub(:all).and_return(@fake_results)
	  
	  @mock1 = mock('Issue')
	  @mock1.stub(:id).and_return(1)
	  @mock1.stub(:name).and_return("aaa")
	  @mock1.stub(:votes).and_return(3)
	  @mock1.stub(:as_a).and_return("yoyo")
	  @mock1.stub(:i_want).and_return("I want")
	  @mock1.stub(:so_that).and_return("so that")
	  @mock1.stub(:as_a).and_return("as a")
	  @mock1.should_receive(:pivotal_issue_id=)
	  @mock1.should_receive(:save)
	  
	  Project.add_issue_to_pivotal(@mock1)
    end
  end
end