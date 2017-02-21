class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @lessons = @category.lessons
  end


  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def lesson_params
    params.require(:lesson).permit(:image, :title, :description, :published, :mp3, :video_id, :category_id)
  end

end
