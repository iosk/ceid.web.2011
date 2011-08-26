class TagsController < ApplicationController

def create
  @bookmark = Bookmark.find(params[:bookmark_id])
  @tag = @bookmark.tags.build(params[:tag])

	respond_to do |format|
	  if @tag.save
	  	flash[:success] = "Thanks for adding a tag dawg!"
      format.html { redirect_to(@bookmark) }
    else
		   flash[:error] = "Something went awfully wrong and your tag was not submitted, please try again."
       format.html { redirect_to(@bookmark) }
    end #if ends
	end #do ends
end

def destroy
end

def update
end


end
