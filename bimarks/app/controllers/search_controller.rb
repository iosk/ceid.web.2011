class SearchController < ApplicationController


  def index

    @search_type = params[:search_type] || "title"

    if @search_type.to_s == 'title'
      @bookmarks = Bookmark.search(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
      if params[:search_type].to_s == 'tags'
      
      
        # Comment this line and uncomment the rest code for a different search functionality:
        #      Instead of searching for tag name "like" the one given by the user
        #      the commented code searches for a tag with exactly the same name as the
        #      one given by the user.
        @bookmarks = Bookmark.search_by_tag(params[:search]).index_by {|r| r[:title]}.values
        #@tag = Tag.find_by_name(params[:search])
        #if @tag.nil?
        #  @bookmarks =[]
        #else
        #  @bookmarks = @tag.bookmarks.paginate(:page => params[:page], :per_page => 10)
        # end
      else
        @bookmarks = []
        
      end
    end
  end
  
end
