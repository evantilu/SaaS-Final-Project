# Copied from Codio assignments.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the LetsMeet home page/
      '/'
    when /the sign in page/
      sign_in_path
      
    # when /my personal home page/
    #   '/session'

    # when /the main page/
    #   '/session'

    # when /the winning page/
    #   '/win'
    # when /the losing page/
    #   '/lose'
    # when /the show page/
    #   '/show'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
