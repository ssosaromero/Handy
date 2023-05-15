class ChatroomsController < ApplicationController
  def index
    # @chatrooms = Chatroom.where(user_id: current_user.id, handyman_id: current_user.handyman.id)
    @chatrooms_user = Chatroom.where(user_id: current_user.id)
    if current_user.handyman
      @chatrooms_handyman = Chatroom.where(handyman_id: current_user.handyman.id)
    end
  end

  def create
    @chatroom = Chatroom.new
    @handyman = Handyman.find(params[:handyman_id])
    @chatroom.user = current_user
    @chatroom.handyman = @handyman
    @chatroom.name = "Handy: #{@handyman.user.full_name} Client: #{current_user.full_name}"
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    end
  end

  def show
    index
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @appointment = Appointment.new
  end
end
