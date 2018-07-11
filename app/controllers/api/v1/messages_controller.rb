class Api::V1::MessagesController < ApplicationController
  before_action :trigger_channel

  def index
    @messages = @channel.messages.order('created_at ASC').map do |message|
      {
        id: message.id,
        author: message.user.email,
        content: message.content,
        created_at: message.created_at
      }
    end
    # messages = @channel.messages.order('created_at ASC')
    # render json: messages # see Message.as_json method
    render json: @messages
  end

  def create
    @message = Message.create(content:params[:content], user: current_user, channel: @channel)
    render json: {
        id: @message.id,
        author: @message.user.email,
        content: @message.content,
        created_at: @message.created_at
      }
  end

  private

  def trigger_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
