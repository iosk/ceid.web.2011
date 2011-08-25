class HomeController < ApplicationController
  def index
     @bookmarks_most_recent = Bookmark.all.first(10)
     @bookmarks_most_rated = Bookmark.all
     respond_to do |format|

<<<<<<< HEAD
      format.html # index.html.erb
      format.xml  { render :action => "index" }
=======
	@bookmarks_most_recent = Bookmark.all.first(10)
	@bookmarks_top_rated = Bookmark.all.sort_by(&:avg_rating).reverse.first(10)

	respond_to do |format|

	format.html # index.html.erb
	format.xml  { render :action => "index" }
>>>>>>> a08779834ed19b34a7c3eb783fa3a18d29dcb2b1
    end
  end



end
