class Project < ActiveRecord::Base
  has_many :issues
  attr_accessible :name, :pivotal_tracker_id

  def create_pivotal_project(name)
  end

  def list_all_pivotal_projects(name)
    #All that generate pivotal tracker stuff
    # return project.all
  end

  def list_all_pivotal_stories(name)
  end

end
