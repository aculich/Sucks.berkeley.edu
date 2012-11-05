require "spec_helper"

describe EndUserIndexController do

  describe "following Telebears Sucks submit button" do
    it "should call the find_all_by_name methods in the model" do
	  @mock = mock('Issue')
	  @mock.stub!(:name).and_return("Telebears")
	  @fake_results = [mock('Issue'), mock('Issue')]
	  Issue.should_receive(:find_all_by_name).with(@mock.name).and_return(@fake_results)
	  get :show, :issue_name => "Telebears"
    end
  end

=begin
  describe "Clicking on one of the given Pivotal Tracker or User Voice issues" do
    it "should link to specific_issue with issue parameter filled out" do
      response.should redirect_to("/specific_issue/#{issue.name}")
    end
  end
=end

end
