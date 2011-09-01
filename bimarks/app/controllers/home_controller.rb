class HomeController < ApplicationController
  def index
    @bookmarks_most_recent = Bookmark.find(:all, :order => "created_at DESC").first(10)
    @bookmarks_top_rated = Bookmark.all.sort_by(&:avg_rating).reverse.first(10) 
    @tag_unique = Tag.all.sort_by(&:count).first(20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :action => "index" }
	end



end
end
