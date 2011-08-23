class RegisterController < ApplicationController

  def right
      @test = User.new(params[:user])
 
      if @test.save
        flash[:notice] = "User created."
        redirect_to :action => "index"
    end
  end
 
 def index
  end
 
end
