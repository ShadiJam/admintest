class LessonsController < ApplicationController

    def index
      @video = Video.where(params[:lesson_id])
      @lesson = Lesson.includes(:videos).all.where(published: true)

    end


    def show
      @lesson = Lesson.includes(:videos).find(params[:id])
    end

    private

    def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :videos)
  end
end
