class Project < ActiveRecord::Base
  has_many :issues
  attr_accessible :name, :pivotal_tracker_id

  def initialize
    PivotalTracker::Client.token = 56376113456f78fe5ce502cd0f6
    @projects = PivotalTracker::Project.all
  end

  def create_pivotal_project(name)
    @new_project = PivotalTracker::Project.create(:name => name)
    Project.create(:name => name, :pivotal_tracker_id => @new_project.id)
  end

  def list_all_pivotal_projects
    return @projects
  end

  def list_all_pivotal_stories
    # We can do this through pivotal tracker or through our own Issues model

    # Through Pivotal Tracker
#    PivotalTracker::Client.token = 4128a56376113456f78fe5ce502cd0f6
#    @projects = PivotalTracker::Project.all
#    @a_project = PivotalTracker::Project.find(:pivotal_tracker_id)
#    return @a_project.stories.all()

    # Through our db
    stories = PivotalTracker::Project.find(self.pivotal_tracker_id).stories.all
    return stories
  end

end
