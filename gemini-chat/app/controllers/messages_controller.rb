class MessagesController < ApplicationController

  def create
    @current_user = current_user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
  end

  def show
    #@messages = @single_room.messages
    @message = Message.find params[:id]
  end

  # def index
  #  # @messages = @single_room.messages
  # end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
