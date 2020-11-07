class MessagesController < ApplicationController
  def show
    @room = Room.find(params[:room_id])
    @message = Message.find(params[:id])
    @company_message = @room.company_messages.new
    @user = @room.user
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if user_signed_in?
      if @message.save
        redirect_to room_path(@room.id)
      else
        @messages = @room.message.includes(:user)
        render room_path(@room.id)
      end
    else
      redirect_to root_path
    end
  end

  private
  def message_params
      params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
