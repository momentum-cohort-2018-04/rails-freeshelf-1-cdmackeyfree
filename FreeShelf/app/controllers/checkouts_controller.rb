class CheckoutsController < ApplicationController
    def index
        if current_user
            @checkouts = current_user.checkouts
        else
            redirect_to new_login_path 
        end
    end
    
    def new
        @checkout = Checkout.new
        @book = Book.find(params[:book_id])
    end
    
    def create
        @checkout = Checkout.new(checkout_params)
        if @checkout.save
            redirect_to checkouts_url, notice: "You've got a new book to read!"
        else
            render :new
        end
    end
    
    def destroy
        @checkout = Checkout.find(params[:id])
        @checkout.destroy
        redirect_to checkouts_path
    end
    
    
    private 
        def checkout_params
            params.require(:checkout).permit(:book_id, :user_id)
        end
end
