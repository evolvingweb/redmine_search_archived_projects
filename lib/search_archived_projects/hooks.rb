module SearchArchivedProjects
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})
      p = context[:request].params
      return unless p[:controller] == "search" && p[:action] == "index"
      javascript_include_tag "search_archived_project", :plugin => 'redmine_search_archived_projects'
    end
  end
end
