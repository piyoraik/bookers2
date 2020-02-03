class UsersController < ApplicationController
  #! ログイン済ユーザーのみ、このコントローラーへのアクセスを許可
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def users
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def books
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
