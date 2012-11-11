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

  describe "retrieving pivotal tracker and uservoice data" do
    it "should call model method to retrieve similar pivotal tracker stories" do
    end

    it "should call model method to retrieve similar uservoice tickets" do
    end
  end

end
