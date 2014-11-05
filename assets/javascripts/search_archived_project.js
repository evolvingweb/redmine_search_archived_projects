jQuery(function() {
  var checked = window.location.search.match(/\bsearch_archived=1/) ? 'checked' : '';

  var input = '<label><input id="search_archived" name="search_archived" type="checkbox" value="1" ' 
              + checked + ' /> Include archived projects</label>';
  jQuery(input).appendTo(jQuery('#scope').parent())

  if (checked) {
    // now update all the search-result links (these are of the form /issues/NNNN
    jQuery('#search-results a').each(function(){
      this.href = this.href.replace(/$/, '?search_archived=1');
    });
    // update pseudo-facets, these are of the form /search?params=...
    jQuery('#search-results-counts a').each(function(){
      this.href = this.href.replace(/$/, '&search_archived=1');
    });
    // pagination links and search-form links are auto-updated by redmine
  }
});
