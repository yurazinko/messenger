class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
    authorize @conversations
    render @conversations
  end

  def create
    @conversation = Conversation.create!(conversation_params)
    authorize @conversation
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
