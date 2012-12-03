require 'spec_helper'
require 'uservoice-ruby'
require 'json'

describe Uservoice_ticket do
  describe "Add issue" do
    it "should add a new model to the datbase" do
	  x = DateTime.parse('2099/12/01 21:25:42 +0000')
	  DateTime.stub(:parse).and_return(x)
	  Daterecord.should_receive(:find_by_id).at_least(1).times.with(1)
	  Uservoice_ticket.poll_uservoice
    end
  end

  describe "Get tickets" do
    it "should call Daterecord" do
	  Daterecord.should_receive(:find_by_name).with('UservoiceDate')
	  Uservoice_ticket.poll_uservoice
    end
  end
end
