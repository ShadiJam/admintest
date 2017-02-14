class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @video = Video.where(params[:lesson_id])
  end

    private

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
