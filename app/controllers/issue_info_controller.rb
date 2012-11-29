class IssueInfoController < ApplicationController

  def index
  end

  def show
    @issue = Issue.find_by_id(params[:issue_id])
    @issue_name = @issue.name
    if params["vote"] == "true"
      @issue.votes += 1
      Project.add_issue_to_pivotal(@issue)             
		  @issue.save!
    end
    @comments = @issue.comments
    if @comments != nil
      @comments.sort! {|a,b| a.date <=> b.date}
    end
    if request.post?
      if params[:pid] != nil
        RequestMailer.send_request(params[:name], params[:email], params[:pid], params[:issue_id]).deliver
        @notice = "Your request has been sent"
      elsif params[:'comment-text'] != nil
        @issue.comments.create!(:commentor_name => params[:'commentor-name'], :date => Time.now, :details => params[:'comment-text'])
      end
    end
    #@comment = Issue.comment.where(:issue_name => @issue_name)
  end

end
