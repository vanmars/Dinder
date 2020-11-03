class MessagesController < ApplicationController

  def index
    @messages = Recipient.where(:user_id => current_user.id).order('created_at DESC')
  end

  def new
    @message = Message.new
    @recipients = User.all
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:alert] = "successful message"
      redirect_to root_path
    else
      flash[:alert] = "did not create"
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
    @sender = User.find(@message.sender_id)
    # binding.pry

  end

  private
  def message_params
    params.require(:message).permit(:body, :sender_id, user_ids: [])
  end
end