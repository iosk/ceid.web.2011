class TagsController < ApplicationController
  # We will use this controller to implement the autocomplete.
  def index
    @tags = Tag.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"]) 
  end
  
  def show
    @tag= Tag.find(params[:id])
    @bookmarks = @tag.bookmarks
    @my_bookmarks = @tag.bookmarks.paginate(:page => params[:page], :per_page => 5)
    @count = @bookmarks.count
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
end
