class LessonsController < ApplicationController
  before_action :set_lesson

  def index
    @lessons = @lessons.all
    @video = @lessons.videos.all(video_params)
  end

  def show
    @category = Category.find(params[:id])
    @lesson = @category.lesson.where(params[:id])
    @video = Video.where(params[:lesson_id])
  end

    private

    def set_lesson
      @lesson = @lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:image, :title, :description, :published, :videos, :mp3, :category)
    end

    def video_params
      params.require(:video).permit(:link)
    end

    def category_params
      params.require(:category).permit(:category_name, :lesson)
    end

end
