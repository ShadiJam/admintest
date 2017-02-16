class BlogsController < ApplicationController
before_action :authenticate_user!

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:blog_name, :blog_content)
  end

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published)
  end

end
