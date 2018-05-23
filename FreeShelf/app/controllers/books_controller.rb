class BooksController < ApplicationController
    def index
      @book = Book.all
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save 
        redirect_to @book, notice: "You did the thing"
      else
        render 'new'
      end
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def edit
      @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])
        
        if @book.update(book_params)
            redirect_to @book
        else
            redirect_to edit_book_path
        end

    end
     
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
     
      redirect_to books_path
    end
  
    private
    def book_params
      params.require(:book).permit(:title, :author_ids, :url, :language, :description)
    end
  
  end
  
