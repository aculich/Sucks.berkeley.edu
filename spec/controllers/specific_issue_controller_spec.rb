require "spec_helper"

describe SpecificIssueController do

  describe "Clicking on the submit button with parameters filled out" do
    it "should link to the issue_info with i_want and so_that parameters" do
      issue = Issue.create()
      issue.name = "Airbears"
      post :show, :issue_name => issue.name, "want-text" => "I want candy", "so-text" => "cavities", :method => "put"
      response.should redirect_to("/issue_info/#{issue.id + 1}")
    end

    it "should call project model methods to create new project if doesn't exist" do
      m_proj = mock("Project")
      m_issues = mock("Issue")
      m_issue = mock("Issue")
      Project.should_receive(:find_by_name).with("Airbears").and_return(m_proj)
      m_proj.should_receive(:issues).and_return(m_issues)
      m_issues.should_receive(:build).and_return(m_issue)
      m_issue.should_receive(:save)
      m_issue.should_receive(:id).and_return(2)
      issue = Issue.create()
      issue.name = "Airbears"
      Project.should_receive(:find_all_by_name).with("Airbears").and_return([])
      Project.should_receive(:create_pivotal_project).with("Airbears")
      post :show, :issue_name => issue.name, "want-text" => "I want candy", "so-text" => "cavities", :method => "put"
    end

    it "should create issue with link to uservoice if originally a ticket" do
      issue = Issue.create()
      issue.name = "Airbears"
      @m_proj = mock('Project')
      @m_issues = mock('Issue')
      @m_new_issue = mock('Issue')
      @m_new_issue.should_receive(:link_to_uservoice=).with("http://uservoice.com")
      @m_new_issue.should_receive(:save)
      @m_new_issue.should_receive(:id).and_return(issue.id + 1)
      Project.should_receive(:find_by_name).with("Airbears").and_return(@m_proj)
	  @m_proj.stub!(:uservoice_url).and_return("http://uservoice.com")
      @m_proj.should_receive(:issues).and_return(@m_issues)
      @m_issues.should_receive(:build).and_return(@m_new_issue)
      post :show, :issue_name => issue.name, "want-text" => "I want candy", "so-text" => "cavities", :method => "put", :uservoice_url => "http://uservoice.com"
      response.should redirect_to("/issue_info/#{issue.id + 1}")
    end
  end

  describe "clicking on the submit button with no i_want parameter entered" do
    it "should redirect to itself with so_that parameter and flash error message" do
      issue = Issue.create()
      issue.name = "Airbears"
      post :show, :issue_name => issue.name, "want-text" => "", "so-text" => "cavities", :method => "put"
      response.should redirect_to("/specific_issue/#{issue.name}")
    end
  end

  describe "clicking on submit button with no so_that parameter entered" do
    it "should redirect to itself with i_want parameter and flash error message" do
      issue = Issue.create()
      issue.name = "Airbears"
      post :show, :issue_name => issue.name, "want-text" => "I want candy", "so-text" => "", :method => "put"
    end
  end
end
