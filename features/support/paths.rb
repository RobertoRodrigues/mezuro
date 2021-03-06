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

    when /^\/projects\/new$/
      new_project_path()

    when /^\/projects\/(.*)$/
      project_path($1)

    when /^\/users\/new$/
      new_user_path()

    when /^\/login$/
      login_path()

    when /^\/(.*)$/
      user_path($1)

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
