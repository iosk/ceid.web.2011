class HomeController < ApplicationController
  def index
    @bookmarks_most_recent = Bookmark.all.last(10)
    @bookmarks_most_rated = Bookmark.all
     respond_to do |format|

      format.html # index.html.erb
      format.xml  { render :action => "index" }
    end
  end

end
