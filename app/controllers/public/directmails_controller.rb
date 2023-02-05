class Public::DirectmailsController < ApplicationController

 def show
  @user = User.find(params[:id])
  rooms = current_user.entries.pluck(:room_id)
  entries = Entry.find_by(user_id: @user.id, room_id: rooms)

  if entries.nil?
   @room = Room.new
   @room.save
   Entry.create(user_id: @user.id, room_id: @room.id)
   Entry.create(user_id: current_user.id, room_id: @room.id)
  else
   @room = entries.room
  end

  @directmails = @room.directmails
  @directmail = Directmail.new(room_id: @room.id)
 end

 def create
  @directmail = current_user.directmails.new(directmail_params)
  @directmail.save
  redirect_to request.referer
 end

 private

 def directmail_params
  params.require(:directmail).permit(:message, :room_id)
 end

end
