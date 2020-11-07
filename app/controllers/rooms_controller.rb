class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.order("created_at DESC")
    @company_message = CompanyMessage.new
    @company_messages = @room.company_messages.order("created_at DESC")

    


    if user_signed_in?
      if @room.user.id == current_user.id
        @company = @room.company
        @user = @room.user

      else
        redirect_to root_path
      end
    elsif company_signed_in?
      if @room.company.id == current_company.id
        @user = @room.user
        @company = @room.company

      else
        redirect_to root_path
      end

    else
      redirect_to root_path
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_company_params)
      @room.user_id = current_user.id
    elsif company_signed_in?
      @room = Room.new(room_user_params)
      @room.company_id = current_company.id
    else
      redirect_to root_path
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to root_path
    end
  end

  private
  def room_company_params
    params.require(:room).permit(:company_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
