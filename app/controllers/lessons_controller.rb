class LessonsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @category = Category.find(params[:id])
    @lessons = @category.lessons

  end

  def show
    @lesson = Lesson.find(params[:id])
    @videos = @lesson.video.all
  end

    private

    def lesson_params
      params.require(:category).permit(lesson: [:image, :title, :description, :published, :mp3, :video_id, :category_id])
    end

    def category_params
      params.require(:category).permit(:category_name, :lesson)
    end

    def video_params
      params.require(:video).permit(:link)
    end

end
