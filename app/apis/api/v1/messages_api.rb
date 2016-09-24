class API::V1::MessagesAPI < API::RootAPI
  version :v1

  resources :messages do
    params do
      requires :message, type: Hash do
        requires :message, type: String
      end
    end
    post do
      authenticate_user!
      message_params = declared(params)[:message]
      @message = current_user.messages.build(message_params)
      if @message.save
        { status: 1 }
      else
        render_error(@message.errors.full_messages, 422)
      end
    end

    get jbuilder: 'v1/messages/index.jbuilder' do
      @messages = Message.includes(:user).all
    end
  end
end
