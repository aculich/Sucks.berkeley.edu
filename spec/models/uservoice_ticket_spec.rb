require 'spec_helper'
require 'uservoice-ruby'
require 'json'

describe Uservoice_ticket do
  describe "Get tickets" do
    it "should call Daterecord" do
	  Daterecord.should_receive(:find_by_name).with('UservoiceDate')
	  Uservoice_ticket.poll_uservoice
    end
  end

  describe "Add issue" do
    it "should add a new model to the datbase" do
	  Time.now.stub(:strftime).and_return("Mon, 03 Dec 0000 14:56:01 UTC +00:00")
	  Daterecord.should_receive(:find_by_id).with(1)
	  Uservoice_ticket.poll_uservoice
    end
  end
end
