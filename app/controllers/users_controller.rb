class UsersController < ApplicationController
  before_action :authorized, only: [:index, :show, :edit, :update, :destroy]

  def index
    # @users = User.all
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @conversations = Conversation.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
      @user = @current_user
  end

  def update
    @current_user.update(user_params)
    redirect_to user_path(@current_user)
  end

  def match
    @user = @current_user.match
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :age, :location, :bio, :picture, :horoscope, :search)
  end


end
