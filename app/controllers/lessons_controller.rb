class LessonsController < ApplicationController

    def index
      @lesson = Lesson.all.where(published: true)
    end


    def show
      @lesson = Lesson.find(params[:id])
    end

    private

    def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :video_url, :published)
  end
end
