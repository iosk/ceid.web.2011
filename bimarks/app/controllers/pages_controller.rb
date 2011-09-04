require 'will_paginate/array'

class PagesController < ApplicationController
  
  
  
  before_filter :admin_user_only, :only => :admin
  
  
  def home
	  @title = "Home"
	  @bookmark = Bookmark.new if signed_in?
  end

  def contact
	  @title = "Contact"
  end

  def about
	  @title = "About"
  end

  def help
	  @title = "Help"
  end
  
  def admin
    @title = "Admin Page"
    
    @flagged_bookmarks = Bookmark.find(:all, :conditions => { :flagged => true}).paginate(:page => params[:page], :per_page => 5)
    @flagged_tags = Tag.find(:all, :conditions => { :flagged => true}).paginate(:page => params[:page], :per_page => 5)
    @flagged_comments = Comment.find(:all, :conditions => { :flagged => true}).paginate(:page => params[:page], :per_page => 5)
    
  end

  def admin_user_only
    unless admin?
      flash[:error] = "WTF you tryin' to do there dawg?"
      redirect_to root_path
      false
    end
  end  
    

end
