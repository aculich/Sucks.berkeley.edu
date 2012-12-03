class IssueInfoController < ApplicationController

  def index
  end

  def show
    @issue = Issue.find_by_id(params[:issue_id])
    @issue_name = @issue.name
    if params["vote"] == "true"
      if not session["upvoted_issues"]
        @issue.votes += 1
        Project.add_issue_to_pivotal(@issue)             
		    @issue.save!
        session["upvoted_issues"] = {@issue.id => "true"}
      elsif (session["upvoted_issues"] and session["upvoted_issues"][@issue.id] != "true")
        @issue.votes += 1
        Project.add_issue_to_pivotal(@issue)             
		    @issue.save!
        session["upvoted_issues"][@issue.id] = "true"
      elsif session["upvoted_issues"] and session["upvoted_issues"][@issue.id] == "true"
        flash[:notice] = "You've already upvoted this issue!"
      end
    end
    @comments = @issue.comments
    if @comments != nil
      @comments.sort! {|a,b| a.date <=> b.date}
    end
    if request.post?
      if params[:pid] != nil
        RequestMailer.send_request(params[:name], params[:email], params[:pid], params[:issue_id]).deliver
        @notice = "Your request has been sent"
      elsif params[:'comment-text'] != nil and params[:'commenter-name'] != nil
        if params[:'developer-code'] == nil or params[:'developer-code'] == ''
          @issue.comments.create!(:commentor_name => params[:'commenter-name'], :date => Time.now, :details => params[:'comment-text'], :from_developer => false)
        else
          if params[:'developer-code'] == @issue.get_pivotal_id.to_s
            @issue.comments.create!(:commentor_name => params[:'commenter-name'], :date => Time.now, :details => params[:'comment-text'], :from_developer => true)
          else
            @notice = "Sorry, the developer code you entered is invalid for this issue. Hint: this is the pivotal tracker project id" 
          end  
        end
      end
    end
  end

end
