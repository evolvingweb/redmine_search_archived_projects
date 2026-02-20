require 'redmine'

# Tell Zeitwerk to ignore this plugin's lib directory
plugin_lib = File.join(File.dirname(__FILE__), 'lib')
Rails.autoloaders.each { |loader| loader.ignore(plugin_lib) }

# Require plugin files (patches self-apply when loaded)
require File.join(plugin_lib, 'search_archived_projects/hooks')
require File.join(plugin_lib, 'search_archived_projects/application_controller_patch')
require File.join(plugin_lib, 'search_archived_projects/project_patch')
require File.join(plugin_lib, 'search_archived_projects/user_patch')

Redmine::Plugin.register :redmine_search_archived_projects do
  name 'Redmine Search Archived Projects'
  author 'Alex Dergachev'
  url 'https://github.com/evolvingweb/redmine_evolvingweb_extensions'
  author_url 'http://evolvingweb.ca'
  description 'Allows searching through archived projects.'
  version '6.0.0'
end
