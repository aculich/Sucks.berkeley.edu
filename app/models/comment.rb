class Comment < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :commentor_name, :date, :details, :issue_id
  attr_accessible :from_developer
end
