class RoomsController < ApplicationController
  def index
    @new_room = Room.new
    @rooms = Room.all
  end

  def create
    @new_room = Room.new(user: current_user)

    if @new_room.save
      @new_room.broadcast_append_to :rooms
    end
  end

  def show
    @room = Room.find_by!(title: params[:title])
     @messages = MessageDecorator.decorate_collection(@room.messages.includes(:user))
      @new_message = current_user&.messages&.build(room: @room)
  end
end