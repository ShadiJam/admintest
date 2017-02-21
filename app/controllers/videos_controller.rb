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

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :mp3, :video_id, :category_id)
  end
end
