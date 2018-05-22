class AuthorsController < ApplicationController

    def index
        @author = Author.all
    end

    def new
    end

    def create
        @author = Author.new(author_params)
        @author.save
        redirect_to @author
    end

    def show
        @author = Author.find(params[:id])
    end

    def edit
    end
        
    def destroy
    end

    private
    def author_params
        params.require(:author).permit(:name)
end
      

end