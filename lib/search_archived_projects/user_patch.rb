module SearchArchivedProjects
  module UserPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :allowed_to?, :archived
      end
    end

    module InstanceMethods
      def allowed_to_with_archived?(action, context, options={}, &block)
        if $search_archived && admin?
          return true
        end
        return allowed_to_without_archived?(action, context, options, &block)
      end

    end
  end

  User.send(:include, UserPatch)
end
