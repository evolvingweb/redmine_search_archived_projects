module SearchArchivedProjects
  module ApplicationControllerPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        before_filter :check_for_search_archived
      end
    end

    module InstanceMethods
      def check_for_search_archived
        if params[:search_archived] == "1"
          unless User.current.admin?
            flash.now[:error] = "Search Archived: can only be activated for admin users."
            return
          end

          flash.now[:alert] = "Search Archived: suspending access checks for admin user."
          $search_archived = params[:search_archived] == "1"
        else
          $search_archived = nil
        end
      end

    end
  end

  # Add module to Welcome Controller
  ApplicationController.send(:include, ApplicationControllerPatch)
end
