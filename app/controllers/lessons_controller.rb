class LessonsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  # def save_my_previous_url
  #   @back_url = session[:my_previous_url]
  # end

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

    private

    def lesson_params
      params.require(:lesson).permit(:image, :title, :description, :published, :mp3, :category)
    end

    def category_params
      params.require(:category).permit(:category_name, :lesson)
    end

end
