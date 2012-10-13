class Issue < ActiveRecord::Base
  attr_accessible :action, :date_entered, :goal, :identity_tags, :name
end
