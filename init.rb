require 'redmine'

require_dependency "search_archived_projects/hooks"
require_dependency "search_archived_projects/application_controller_patch"
require_dependency "search_archived_projects/project_patch"
require_dependency "search_archived_projects/user_patch"

Redmine::Plugin.register :redmine_search_archived_projects do
  name 'Redmine Search Archived Projects'
  author 'Alex Dergachev'
  url 'https://github.com/evolvingweb/redmine_evolvingweb_extensions'
  author_url 'http://evolvingweb.ca'
  description 'Allows searching through archived projects.'
  version '0.0.1'
end
