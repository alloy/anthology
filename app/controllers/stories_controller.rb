class StoriesController < ApplicationController
  def new
    @story = Story.new
  end
end
