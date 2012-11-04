class Issue < ActiveRecord::Base
  # attr_accessible :action, :date_entered, :goal, :name, :identity_tags
  attr_accessible :name, :link_to_uservoice, :date_entered, :votes, :action
  # has_many :identity_tags
  # TODO make has_many with identity_tags, but we actually have to make the class
end
