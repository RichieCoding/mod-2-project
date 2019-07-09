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

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followee_id)
  end
end
