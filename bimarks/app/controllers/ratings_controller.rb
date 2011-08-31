class RatingsController < ApplicationController

  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => [:destroy, :update]


# This method creates a rating
def create
	@bookmark = Bookmark.find(params[:bookmark_id])
	@rating = @bookmark.ratings.build(params[:rating])
	@rating.user = current_user

	respond_to do |format|
	if @rating.save
		flash[:success] = "Thanks for rating dawg!"
          	format.html { redirect_to(@bookmark) }
        else
		flash[:error] = "Something went awfully wrong and your rating was not submitted, please try again."
         	format.html { redirect_to(@bookmark) }
        end #if ends
	end #do ends
	
end

# update a rating
def update
	
	@rating = current_user.ratings.find(params[:id])
	@bookmark = Bookmark.find_by_id(@rating.bookmark.id)

	respond_to do |format|
		if @rating.update_attributes(params[:rating])
			flash[:success] = "Thanks for the new rating duder."
        		format.html { redirect_to(@bookmark) }
		else
			flash[:error] = "Something went awfully wrong and your rating was not submitted, please try again"
			format.html { redirect_to(@bookmark) }
		end  
	end
end

# Destroys a rating
def destroy
	@rating = current_user.ratings.find(params[:id])
	@bookmark = Bookmark.find(params[:bookmark_id])
    
	@rating.destroy
    
	respond_to do |format|
      		format.html { redirect_to @bookmark }
    	end
end

def authorized_user
      @bookmark = current_user.bookmarks.find_by_id(params[:id])
      redirect_to root_path if @bookmark.nil?
end

end
