class API::V1::UserAPI < API::RootAPI
  version :v1

  resource :user do
    params do
      requires :user, type: Hash do
        requires :email, type: String
        requires :password, type: String
        requires :username, type: String
        requires :tel, type: String
        requires :partment, type: String
        requires :tag, type: String
      end
    end
    post 'regist' do
      @user = User.create(declared(params)[:user])
      if @user.save
        { status: 1, data: @user }
      else
        error!({"error" => @user.errors.full_messages}, 422)
      end
    end

    params do
      requires :user, type: Hash do
        requires :email, type: String
        requires :password, type: String
      end
    end
    post 'login' do
      user_params = declared(params)[:user]
      @user = User.find_by(email: user_params[:email])
      if @user
        if @user.valid_password?(user_params[:password])
          warden.set_user(@user)
          { data: @user }
        else
          render_error(["密码不正确"], 403)
        end
      else
        render_error(["用户不存在"], 404)
      end
    end

    params do
      requires :user, type: Hash do
        requires :password, type: String
        requires :new_password, type: String
      end
    end
    put do
      user_params = declared(params)[:user]
      @user = current_user
      if current_user.valid_password?(user_params[:password])
        if current_user.update(password: user_params[:new_password])
          warden.set_user(@user)
          { status: 1 }
        else
          render_error(current_user.errors.full_messages, 422)
        end
      else
        render_error(["原始密码错误"], 403)
      end
    end

    delete "logout" do
      warden.set_user(nil)
      { status: 1 }
    end
  end
end
