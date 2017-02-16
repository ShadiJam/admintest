class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @lesson = Lesson.where(params[:category_id])
  end


  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :mp3, :category)
  end

end
