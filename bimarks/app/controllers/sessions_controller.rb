class SessionsController < ApplicationController

  def new
    @title = "Log in"
  end

 def create
    user = User.authenticate(params[:session][:username],
                             params[:session][:password])
    if user.nil?
	# This chunk of code handles failed log in
	flash.now[:error] = "Invalid username or password."
	@title = "Log in"
	render 'new'
    else
      # Sign the user in and redirect to the user's show page.
	log_in user
	flash[:success] = "Welcome back " + user.username
	redirect_back_or user
    end
  end

  def destroy
	log_out
	redirect_to root_path
  end
end
