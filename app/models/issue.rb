require 'pivotal-tracker'

class Issue < ActiveRecord::Base
  # attr_accessible :action, :date_entered, :goal, :name, :identity_tags
  has_many :comments
  belongs_to :Project
  attr_accessible :name, :link_to_uservoice, :date_entered, :votes, :action, :as_a, :so_that, :i_want
  debugger
  x = 9
  # has_many :identity_tags
  # TODO make has_many with identity_tags, but we actually have to make the class
end
