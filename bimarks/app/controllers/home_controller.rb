class HomeController < ApplicationController
  def index
    @bookmarks = Bookmark.all.last(10).reverse
    @bookmarks2 = Bookmark.all
     respond_to do |format|

      format.html # index.html.erb
      format.xml  { render :action => "index" }
    end
  end

end
