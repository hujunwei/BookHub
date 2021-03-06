class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)    # Strong paramter
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Book Hub!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def new
  	@user = User.new

  end

  def index

  end

 private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
