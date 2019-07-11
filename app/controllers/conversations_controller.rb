class ConversationsController < ApplicationController
  
  def index 
    @users = User.all 
    @conversations = @current_user.filtered_conversations
  end 

  def show 
    @user = User.find(params[:id])
  end 

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
  end 

private 

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end



end
