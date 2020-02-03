class BooksController < ApplicationController
    def show
        @user = current_user
        @book = Book.new
        @books = Book.find(params[:id])
    end

    def create
        user = User.find(params[:user_id])
        book = current_user.books.new(books_params)
        book.save
        redirect_to user_path(current_user)
    end

    private
        def books_params
            params.require(:book).permit(:user_id,:title,:body)
        end
end
