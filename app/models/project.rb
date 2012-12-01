class Project < ActiveRecord::Base
  has_many :issues
  attr_accessible :name, :pivotal_tracker_id

  def self.create_pivotal_project(name)
    PivotalTracker::Client.token = GlobalConstants::CLIENT_TOKEN
    already_in_pt = (PivotalTracker::Project.all.map{|x| x.name}).include?(name)
    if(!already_in_pt)
      new_project = PivotalTracker::Client.connection["/projects"].post("<project><name>#{name}</name><iteration_length type=\"integer\">2</iteration_length><point_scale>0,1,3,9,27</point_scale></project>", :content_type => 'application/xml')
      pid = PivotalTracker::Project.parse(new_project).id
    else
      pid = PivotalTracker::Project.all.select {|x| x.name == name}[0].id
    end
    Project.create!(:name => name, :pivotal_tracker_id => pid)
  end

  def self.add_issue_to_pivotal(issue)
    issue.get_progress()
    if issue.votes == 3
      PivotalTracker::Client.token = GlobalConstants::CLIENT_TOKEN
      proj = PivotalTracker::Project.all.select {|x| x.name == issue.name}[0]
      if issue.as_a == nil
		pivotal_issue = proj.stories.create(:name => "As a user of #{issue.name}, I want #{issue.i_want} so that #{issue.so_that}", :story_type => 'feature')
      else 
        pivotal_issue = proj.stories.create(:name => "As a #{issue.as_a}, I want #{issue.i_want} so that #{issue.so_that}", :story_type => 'feature')
      end
	  issue.pivotal_issue_id = pivotal_issue.project_id
    end
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
