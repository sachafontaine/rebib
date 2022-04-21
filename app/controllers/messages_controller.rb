class MessagesController < ApplicationController
  before_action :find_chatroom!

  def create
    @chatroom ||= Chatroom.create(sender_id: current_user.id, receiver_id: @receiver.id)
    @message = current_user.messages.build(message_params)
    @message.chatroom_id = @chatroom.id
    @message.save!
    flash[:success] = "Votre message est bien envoyé !"
    redirect_to chatroom_path(@chatroom)
  end

  def new
    @message = current_user.messages.build
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def find_chatroom!
    @chatroom = Chatroom.find_by(id: params[:chatroom_id])
    redirect_to(root_path) and return unless @chatroom && @chatroom.participates?(current_user)
  end
end
