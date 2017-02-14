class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @lesson = Lesson.where(params[:category_id])
    @video = Video.where(params[:lesson_id])
  end

  def new
    @category = Category.find(params[:id])
    @lesson = @category.Lesson.new(lesson_params)
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.create(lesson_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.find(params[:id])
    @lesson.destroy
    redirect_to category_path(@category)
  end


  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def video_params
    params.require(:video).permit(:link)
  end

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :videos, :mp3, :category)
  end

end
