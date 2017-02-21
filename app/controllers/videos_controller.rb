class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @videos = @lesson.videos
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
