require "spec_helper"

describe IdentityController do
#  describe "typing in the text box" do
#    it "should look up values for field autocomplete and create JS Array" do
#    end

#    it "should look up values from" do
#    end
#  end

  describe "clicking on the submit button with parameters" do
    it "should link to page_five with name, action, goal, identity parameter" do
      issue = Issue.create()
      post :show, :issue_id => issue.id, "what-text" => "cookie monster", :method => "put"
      response.should redirect_to("/summary/#{issue.id}")
    end
  end

  describe "clicking on the submit button with no identity parameter" do
    it "should redirect to itself with name, action, goal parameter and flash error message" do
      issue = Issue.create()
      new_id = issue.id + 1
      post :show, :issue_id => issue.id, :method => "put", "what-text" => ""
      response.should redirect_to("/identity/#{issue.id}")
    end
  end
end
