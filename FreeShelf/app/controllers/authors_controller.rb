class AuthorsController < ApplicationController

    def index
        @author = Author.all
    end

    def new
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to @author
        else
            render 'new'
        end
    end

    def show
        @author = Author.find(params[:id])
    end

    def edit
    end
        
    def destroy
        @author = Author.find(params[:id])
        @author.destroy
     
        redirect_to authors_path
    end

    private
    def author_params
        params.require(:author).permit(:author_ids)
    end
      

end