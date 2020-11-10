class CompanyMessagesController < ApplicationController
def show
  @room = Room.find(params[:room_id])
  @company_message = CompanyMessage.find(params[:id])
  @message = @room.messages.new
  @company = @room.company
end

  def create
    @room = Room.find(params[:room_id])
    @company_message = @room.company_messages.new(company_message_params)
    if company_signed_in?
      if @company_message.save
        redirect_to room_path(@room.id)
      else
        redirect_to room_path(@room.id)
      end
    else
      redirect_to root_path
    end
  end

  private
  def company_message_params
      params.require(:company_message).permit(:message).merge(company_id: current_company.id)
  end
end
