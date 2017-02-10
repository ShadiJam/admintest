class VideosController < ApplicationController
  def show
    @video = Video.where(params[:lesson_id]).all
  end

  def index
      @videos = Video.where(params[:lesson_id])
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @video = @lesson.Video.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @video = @lesson.Video.new(video_params)
    if @video.save
      flash[:success] = 'Video added!'
      redirect_to root_url
    else
      render :new
    end
  end

end

private

def video_params
  params.require(:video).permit(:link)
end

end
