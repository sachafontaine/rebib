class ChatroomsController < ApplicationController
  before_action :set_chatroom, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
    @chatrooms = Chatroom.participating(current_user).order('updated_at DESC')
  end

  def show
    @message = Message.new
  end

  def new
    redirect_to chatroom_path(@chatroom) and return if @chatroom
    @message = current_user.messages.build
  end
end

private

def find_chatroom!
  if params[:receiver_id]
    @receiver = User.find_by(id: params[:receiver_id])
    redirect_to(root_path) and return unless @receiver
    @chatroom = Chatroom.between(current_user.id, @receiver.id)[0]
  else
    @chatroom = Chatroom.find_by(id: params[:chatroom_id])
    redirect_to(root_path) and return unless @chatroom && @chatroom.participates?(current_user)
  end
end

def set_chatroom
  @chatroom = Chatroom.find_by(id: params[:id])
end

def check_participating!
  redirect_to root_path unless @chatroom && @chatroom.participates?(current_user)
end
