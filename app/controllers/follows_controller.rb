class FollowsController < ApplicationController

  def index
    @follows = Follow.all
  end

  def show
    @follow = Follow.find(params[:id])
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.create(follow_params)
    redirect_to user_path(@follow.follower)
  end

  def chicken
    # byebug
    @follow = Follow.create(
      followee_id: params[:id],
      follower_id: @current_user.id
    )
    redirect_to user_path(params[:id])
  end

  def delete
    @follow = Follow.find_by(follower_id: @current_user.id, followee_id: params[:id])
    @follow.destroy
    redirect_to user_path(params[:id])
  end



  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followee_id)
  end
end
