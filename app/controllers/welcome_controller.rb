class WelcomeController < ApplicationController

    def index
      @lessons = Lesson.all
    end


    def show
      @lesson = Lesson.find(params[:id])
    end

  private

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :videos)
  end

end
