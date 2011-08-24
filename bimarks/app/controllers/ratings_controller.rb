class BookmarksController < ApplicationController
  before_filter :authorized_user, :only => [:destroy, :create, :edit]


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
	@bookmark = Bookmark.find(params[:bookmark_id])

	respond_to do |format|
	if @rating.update_attributes(params[:rating])
        	format.html { redirect_to(@bookmark, :notice => 'Thank you for updating your rating!') }
	else
		format.html { redirect_to(@bookmark, :notice => 'There was an error saving your rating.') }
	end  
	end
end

def destroy
	@rating = current_user.ratings.find(params[:id])
	@bookmark = Bookmark.find(params[:bookmark_id])
    
	@rating.destroy
    
	respond_to do |format|
      		format.html { redirect_to @bookmark }
    	end
end



end
