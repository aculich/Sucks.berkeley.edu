class Comment < ActiveRecord::Base
  belongs_to :Issue
  attr_accessible :commentor_name, :date, :details
end
