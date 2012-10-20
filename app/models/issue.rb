class Issue < ActiveRecord::Base
  attr_accessible :action, :date_entered, :goal, :name
  has_many :id_tags
end
