class BookmarksController < ApplicationController
  # GET /bookmarks
  # GET /bookmarks.xml

  before_filter :authenticate, :only => [:create, :destroy, :new, :edit, :update]
  before_filter :authorized_user, :only => :destroy


  def index
#     @bookmarks = Bookmark.all
      @bookmarks = Bookmark.paginate(:page => params[:page], :per_page => 5)

      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.xml
  def show
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/new
  # GET /bookmarks/new.xml
  def new
    @bookmark = Bookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookmark }
    end
  end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.xml
  def create
    @bookmark = current_user.bookmarks.build(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
      flash[:success] = "Bookmark was successfully submitted"

        format.html { redirect_to(@bookmark) }
        format.xml  { render :xml => @bookmark,:action=>"rss", :status => :created, :location => @bookmark  }
      else
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

      format.html { redirect_to(root_path) }
      format.xml  { head :ok }
    end
  end

def feed
   @bookmarks = Bookmark.find(:all, :order=>"created_at DESC", :limit => 15)  
    response.headers["Content-Type"] = "application/xml; charset=utf-8"  
    render :action=>"rss", :layout=>false 
   
end


    def authorized_user
      @bookmark = current_user.bookmarks.find_by_id(params[:id])
      redirect_to root_path if @bookmark.nil?
    end
end
