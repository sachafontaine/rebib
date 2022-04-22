class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      # redirect_to conversation_path(@conversation, anchor: "message-#{@message.id}")
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
