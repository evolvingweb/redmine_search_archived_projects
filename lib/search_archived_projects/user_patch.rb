module UserPatch
  def allowed_to?(action, context, options={}, &block)
    if $search_archived && admin?
      return true
    end
    super
  end
end

User.prepend UserPatch
