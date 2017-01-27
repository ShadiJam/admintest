class WelcomeController < ApplicationController

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

end
