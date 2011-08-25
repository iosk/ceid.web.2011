class HomeController < ApplicationController
  def index
     @bookmarks_most_recent = Bookmark.all.first(10)
     @bookmarks_top_rated = Bookmark.all.sort_by(&:avg_rating).reverse.first(10)
     respond_to do |format|


      format.html # index.html.erb
      format.xml  { render :action => "index" }

  	end



end
end
