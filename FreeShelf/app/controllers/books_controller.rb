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
        redirect_to @book , notice: "You did the thing"
      else
        render 'new'
      end
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def edit
      if current_user
          @book = Book.find(params[:id])
      else
          redirect_to new_login_path, alert: "Only users who created the entry have permisson to edit it."
      end
    end

    def update
      @book = Book.find(params[:id])
        if current_user.id == @book.user_id
            if @book.update(book_params)
                redirect_to @book 
            else
                redirect_to edit_book_path
            end
        else
            redirect_to edit_book_path, alert: "Only users who created the entry have permisson to edit it."
        end
    end
     
    def destroy
      @book = Book.find(params[:id])
      if current_user
        if current_user.id == @book.user_id
            @book.destroy
            redirect_to books_path
        else
            redirect_to book_path, alert: "You don't have permission to destroy this book."
        end
      else
        redirect_to new_login_path
      end
    end
  
    private
    def book_params
      params.require(:book).permit(:title, :author_ids, :url, :language, :description)
    end
  
  end
  
