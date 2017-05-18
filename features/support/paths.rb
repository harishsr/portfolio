Given /^I go to the (.+)/ do |path|
    visit route_for(path)
end

def route_for(path)
  case path
  when /home/i
    root_path
  when /root/i
    root_path
  when /entry index/i
    root_path
  when /admin signup/i
    new_admin_registration_path
  when /admin (login|log in)/i
    new_admin_session_path
  else
    raise "Can't find a path for \"#{path}\"."
  end
end
