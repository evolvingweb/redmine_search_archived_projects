require 'redmine'

Redmine::Plugin.register :redmine_search_archived_projects do
  name 'Redmine Search Archived Projects'
  author 'Alex Dergachev'
  url 'https://github.com/evolvingweb/redmine_evolvingweb_extensions'
  author_url 'http://evolvingweb.ca'
  description 'Allows searching through archived projects.'
  version '7.0.0'
  requires_redmine version_or_higher: '7.0.0'
end

# R7: apply the patches DIRECTLY (they no longer self-apply at file bottom; the
# modules autoload via Zeitwerk). The Hooks ViewListener self-registers on
# eager-load. NOTE: ProjectPatch/UserPatch build alias_method chains, so the
# `unless included?` guards matter — a double include would re-alias. refs #108530.
unless Project.included_modules.include?(SearchArchivedProjects::ProjectPatch)
  Project.include(SearchArchivedProjects::ProjectPatch)
end

unless User.included_modules.include?(SearchArchivedProjects::UserPatch)
  User.include(SearchArchivedProjects::UserPatch)
end

unless ApplicationController.included_modules.include?(SearchArchivedProjects::ApplicationControllerPatch)
  ApplicationController.include(SearchArchivedProjects::ApplicationControllerPatch)
end
