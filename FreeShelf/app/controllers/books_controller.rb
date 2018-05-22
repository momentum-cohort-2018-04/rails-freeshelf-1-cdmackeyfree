class BooksController < ApplicationController
    def index
      @book = Book.all
    end
  
    def new
    end
  
    def create
      @book = Book.new(book_params)
      @book.save
      redirect_to @book
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def edit
    end
     
    def destroy
    end
  
    private
    def book_params
      params.require(:book).permit(:title, :author, :url, :language, :description)
    end
  
  end
  
