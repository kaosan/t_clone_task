class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def top
  end
  
  def index
    @messages = Message.all
  end
  def new
    if params[:back]
      @message = Message.new(message_params)
    else
      @message = Message.new
    end
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "投稿しました"
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @message.update(message_params)
      redirect_to messages_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to messages_path, notice: "ブログを削除しました"
  end
  
  def confirm
    @message = Message.new(message_params)
    render :new if @message.invalid?
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
