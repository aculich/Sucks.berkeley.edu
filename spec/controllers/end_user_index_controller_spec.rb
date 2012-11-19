require "spec_helper"

describe EndUserIndexController do

  describe "following Telebears Sucks submit button" do
    it "should call the find_all_by_name methods in the model" do
	    @mock = mock('Issue')
	    @mock.stub!(:name).and_return("Telebears")
	    @fake_results = [mock('Issue'), mock('Issue')]
	    Issue.should_receive(:find_all_by_name).with(@mock.name).and_return(@fake_results)
	    get :show, :issue_name => "Telebears"
        assigns(:issues).should == @fake_results
    end
  end

  describe "retrieving pivotal tracker and uservoice data" do
    it "should call model method to retrieve similar uservoice tickets" do
        @mock = mock('Uservoice_ticket')
	    @mock.stub!(:subject).and_return("Telebears")
	    @fake_results = [mock('Uservoice_ticket'), mock('Uservoice_ticket')]
        Uservoice_ticket.should_receive(:find_all_by_subject).with(@mock.subject).and_return(@fake_results)
        get :show, :issue_name => "Telebears"
        assigns(:uservoice_tickets).should == @fake_results
    end
  end

end
