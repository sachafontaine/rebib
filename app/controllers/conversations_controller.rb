class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    authorize @conversation
  end

  def index
    @conversations = policy_scope(Conversation).order(created_at: :desc)
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_path(@conversation)
    skip_authorization
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
