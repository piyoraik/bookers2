class BooksController < ApplicationController
    def show
        @user = current_user
        @book = Book.new
        @books = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def create
        @user = User.find(current_user.id)
        @book = current_user.books.new(books_params)
        @books = Book.all
        if @book.save
            flash[:message] = "You have creatad book successfully."
            redirect_to user_path(current_user)
        else
            render 'users/books'
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    def update
        @book = Book.find(params[:id])
        @book.update(books_params)
        flash[:message] = "You have updated book successfully."
        redirect_to book_path(@book)
    end

    private
        def books_params
            params.require(:book).permit(:user_id,:title,:body)
        end
end
