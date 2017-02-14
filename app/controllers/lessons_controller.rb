class LessonsController < ApplicationController
  before_action :set_lesson

  def index
    @category = Category.find(params[:category_id])
    @lessons = @category.lessons.all(lesson_params)
    @video = @lessons.videos.all(video_params)
  end

  def show
    @category = Category.find(params[:id])
    @lesson = Lesson.find(params[:id])
    @video = Video.where(params[:lesson_id])
  end

    private

    def set_lesson
      @lesson = Lesson.find(params[:id])
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
