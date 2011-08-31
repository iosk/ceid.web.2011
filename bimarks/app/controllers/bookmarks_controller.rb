require 'will_paginate/array'
class BookmarksController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  before_filter :authenticate, :only => [:create, :destroy, :new]
  before_filter :authorized_user, :only => [:destroy, :edit, :update]

  # GET /bookmarks
  # GET /bookmarks.xml
  def index
    if sort_direction == 'asc'
      @bookmarks = Bookmark.all.sort_by(&:"#{sort_column}").paginate(:page => params[:page], :per_page => 15)
    else
      @bookmarks = Bookmark.all.sort_by(&:"#{sort_column}").reverse.paginate(:page => params[:page], :per_page => 15)
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.xml
  def show
	  @bookmark = Bookmark.find(params[:id])

	  if signed_in?
	   @new_comment = Comment.new
	   # @new_comment = @bookmark.comments.new
	   # @new_comment.user = current_user
		  @current_user_rating = @bookmark.ratings.find_by_user_id(current_user.id)
		  unless @current_user_rating 
			  # if current_user has not rated this bookmark yet then create a new rating
		  	@current_user_rating = @bookmark.ratings.new
			  @current_user_rating.user = current_user
		  end
	  end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.xml
  def new
	@bookmark = Bookmark.new
	@bookmark.taggings.build
	@bookmark.tags.build

	respond_to do |format|
	format.html # new.html.erb
	format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
	  @bookmark = Bookmark.find(params[:id])
	  #if @bookmark.tags.empty?
     # 3.times { tag = @bookmark.tags.build }
  #  end
  end

  # POST /bookmarks
  # POST /bookmarks.xml
  def create
	  @bookmark = current_user.bookmarks.build(params[:bookmark])
#	  @bookmark.tags.build(params[:tags_attributes])
  	# We create a new rating for this bookmark
  	# and we save it.
  	# We assume that every user submitting a new bookmark
	  # will automatically rate it as a 5 ~ else what's the reason
  	# of submitting it in the first place?
  	@this_rating = @bookmark.ratings.build(params[:rating])
  	@this_rating.bookmark_id = @bookmark
    @this_rating.user = current_user
	  @this_rating.stars = 5
	  @this_rating.save 

	  respond_to do |format|
	    if @bookmark.save
	      flash[:success] = "Bookmark was successfully submitted"
        format.html { redirect_to(@bookmark) }
        format.xml  { render :xml => @bookmark,:action=>"rss", :status => :created, :location => @bookmark  }
      else
	      flash[:error] = "Bookmark was not submitted :~("
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookmarks/1
  # PUT /bookmarks/1.xml
  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(@bookmark, :notice => 'Bookmark was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookmark.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.xml
  def destroy
	@bookmark = Bookmark.find(params[:id])
	@bookmark.destroy
	flash[:notice] = "Bookmark was successfully deleted"
	respond_to do |format|    
	 	format.html {redirect_to(current_user)}
		format.xml  { head :ok }
    end
  end

  def feed
  	@bookmarks = Bookmark.find(:all, :order=>"created_at DESC", :limit => 15)  
  	response.headers["Content-Type"] = "application/xml; charset=utf-8"  
	  render :action=>"rss", :layout=>false 
   
  end


  def authorized_user
    (@bookmark = current_user.bookmarks.find_by_id(params[:id])
    redirect_to(root_path, :notice => 'WTF are you trying to do there dawg?! ~ The site\'s secure, got that?') if @bookmark.nil?)     unless current_user.is_admin?
  end
  # We define these two new methods as to avoid sql injection problems
# by users who tweak the url address. 
  
private
  def sort_column
    (Bookmark.column_names.include?(params[:sort]) || ["owner", "avg_rating"].include?(params[:sort]) )? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
