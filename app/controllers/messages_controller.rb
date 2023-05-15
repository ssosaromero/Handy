class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id]) # Creo el chatroom
    @message = Message.new(message_params) # creo el mensaje con sus parámetros
    @message.chatroom = @chatroom # asigno el chatroom al mensaje
    @message.user = current_user # asigno el usuario al mensaje
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
