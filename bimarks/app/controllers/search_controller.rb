require 'will_paginate/array'
class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction


  def index
    @search_type = params[:search_type]

    
    if search_type.to_s == 'title'
      if sort_direction == 'asc'
        @bookmarks = Bookmark.search(params[:search]).sort_by(&:"#{sort_column}").paginate(:page => params[:page], :per_page => 15)
      else
        @bookmarks = Bookmark.search(params[:search]).sort_by(&:"#{sort_column}").reverse.paginate(:page => params[:page], :per_page => 15)
      end
        
    else
      if search_type.to_s == 'tags'
      
        
         # Comment this line and uncomment the rest code for a different search functionality:
         #      Instead of searching for tag name "like" the one given by the user
         #      the commented code searches for a tag with exactly the same name as the
         #      one given by the user.
          if sort_direction == 'asc'
            @bookmarks = Bookmark.search_by_tag(params[:search]).index_by {|r| r[:title]}.values.sort_by(&:"#{sort_column}").paginate(:page => params[:page], :per_page => 15)
          else
             @bookmarks = Bookmark.search_by_tag(params[:search]).index_by {|r| r[:title]}.values.sort_by(&:"#{sort_column}").reverse.paginate(:page => params[:page], :per_page => 15)
           end
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
  
  private
  
  def search_type
    %w[tags title].include?(params[:search_type]) ? params[:search_type] : "title"
  end
  
# We define these two new methods as to avoid sql injection problems
# by users who tweak the url address. 

  
  
end
