class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new(conversation_params)
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
