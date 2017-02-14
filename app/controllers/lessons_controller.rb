class LessonsController < ApplicationController

    def index
      @video = Video.where(params[:lesson_id]).all
      @lessons = Lesson.includes(:videos).all.where(published: true)
    end


    def show
      @lesson = Lesson.find(params[:id])
      @video = Video.where(params[:lesson_id])
    end

    private

    def lesson_params
      params.require(:lesson).permit(:image, :title, :description, :published, :videos, :mp3)
    end

    def video_params
      params.require(:video).permit(:link)
    end

end
