module SearchArchivedProjects
  module ProjectPatch
    def self.included(base) # :nodoc:
      base.class_eval do
        def self.allowed_to_condition_with_archived(user, permission, options={})
          orig = self.allowed_to_condition_without_archived(user, permission, options)
          # remove the filtering-out of archived projects
          return $search_archived ? orig.sub('projects.status <> 9 AND ', '') : orig
        end

        Project.singleton_class.send(:alias_method, :allowed_to_condition_without_archived, :allowed_to_condition)
        Project.singleton_class.send(:alias_method, :allowed_to_condition, :allowed_to_condition_with_archived)

      end
    end
  end

  Project.send(:include, ProjectPatch)
end
