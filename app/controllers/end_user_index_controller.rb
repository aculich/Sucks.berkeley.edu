class EndUserIndexController < ApplicationControllers

  def index
  end

  def show
    @issue_name = params["what-text"]
    @issues = Issue.filter_by_name(@issue_name)
    @comment = @issues.comment.where(:issue_name => @issue_name)
    redirect_to "/specific_issue/#{@issue_name}"
  end
  
end
