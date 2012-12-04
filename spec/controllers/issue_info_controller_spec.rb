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
	
	#it "should call get_progress" do
	#  @mock = mock('Issue')
	#  @mock.stub(:name).and_return("Telebears")
	#  @mock.stub(:comments).and_return([2])
	#  Issue.should_receive(:find_by_id).with("1").and_return(@mock)
	#  @mock.should_receive(:get_progress)
	#  get :show, :issue_id => 1
	#end
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

  describe "clicking on the submit comment button" do

    it "should post comment without dev code" do
      @m_comment = mock('Comment')
      comments = [@m_comment]
      issue = Issue.create()
      issue.name = "Airbears"
	  Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
      issue.should_receive(:comments).and_return(comments)
      comments.should_receive(:create!)
	  post :show, :'issue_id' => issue.id, :'comment-text' => 'blah', :'commenter-name' => 'blah', :method => 'put'
	end

    it "should post dev comments if code matches" do
      @m_comment = mock('Comment')
      comments = [@m_comment]
	  @mock = mock('Project')
	  @mock.stub!(:pivotal_tracker_id).and_return(6)
      issue = Issue.create()
	  issue.should_receive(:project).and_return(@mock)
      issue.name = "Airbears"
	  Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
      issue.should_receive(:comments).and_return(comments)
      comments.should_receive(:create!)
	  post :show, :'issue_id' => issue.id, :'comment-text' => 'blah', :'commenter-name' => 'blah', :'developer-code' => '6', :method => 'put'
	end
 
    it "should not post dev comments if code mismatches" do
	  @mock = mock('Project')
	  @mock.stub!(:pivotal_tracker_id).and_return(6)
      issue = Issue.create()
	  issue.should_receive(:project).and_return(@mock)
      issue.name = "Airbears"
	  Issue.should_receive(:find_by_id).with(issue.id.to_s).and_return(issue)
	  post :show, :'issue_id' => issue.id, :'comment-text' => 'blah', :'commenter-name' => 'blah', :'developer-code' => 'blah', :method => 'put'
      assigns(:notice).should == "Sorry, the developer code you entered is invalid for this issue. Hint: this is the pivotal tracker project id"
	end
  end
end
