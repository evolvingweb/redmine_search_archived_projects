redmine_search_archived_projects
================================

Redmine plugin to facilitate searching through archived projects. 

Useful if you prefer to "Archive" rather than "Close" projects, to make all the
open issues disappear.  Injects a check box on search form "Include archived
projects", which injects "?search_archived=1" parameter on any page, including
search pages. This parameter will only get picked up for admin users.

Tested against Redmine 2.6, likely to work with 1.4 as well.

Related: http://www.redmine.org/issues/6049
