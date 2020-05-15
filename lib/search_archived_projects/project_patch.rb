module ProjectPatch
  def allowed_to_condition(user, permission, options={})
    orig = super(user, permission, options)
    # remove the filtering-out of archived projects
    return $search_archived ? orig.sub('projects.status <> 9 AND ', '') : orig
  end

end

Project.prepend ProjectPatch
