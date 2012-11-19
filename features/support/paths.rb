# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the Sucks.Berkeley.edu home\s?page$/
      '/'
    when /^Page 2 for the issue "(.*)"$/
      "/end_user_index/#{$1}"
  
    when /^Page 3 for the issue "(.*)"$/
      "/specific_issue/#{$1}"
      
    when /^Page 4 for the issue "(.*)"$/
      "/issue_info/#{Issue.find_by_name($1).id}"
      
    when /^Page 5 for the issue "(.*)"$/
      "/summary/#{Issue.find_by_name($1).id}"

    when /^the End User Index Page for (.*)$/
      issue_name = $1
      if $1.include?(" ") 
        issue_name = $1.split(" ")
        issue_name = issue_name[0] + "%20" + issue_name[1]
      end
      "/end_user_index/#{issue_name}"

    when /^the Issue Info Page for (.*)$/
      issue = Issue.find_by_so_that($1)
      debugger
      "/issue_info/#{issue.id}"


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
