class LessonsController < ApplicationController

    def index
      @lesson = Lesson.all.where(published: true)
    end


    def show
      @lesson = Lesson.find(params[:id])
    end

end
