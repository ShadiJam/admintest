class VideosController < ApplicationController
  def show
    @video = Lesson.find(params[:id])
  end
end
