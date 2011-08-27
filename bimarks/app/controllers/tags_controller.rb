class TagsController < ApplicationController


def index
  @tags = Tag.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
end
end
