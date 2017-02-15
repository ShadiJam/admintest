class VideosController < ApplicationController

  def show
    @video = @lesson.videos.where(video_params)
  end

  def index
      @videos = Video.all
  end


end

private

def video_params
  params.require(:video).permit(:link)
end

end
