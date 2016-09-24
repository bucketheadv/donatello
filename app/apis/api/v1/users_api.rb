class API::V1::UsersAPI < API::RootAPI
  version :v1
  resources :users do
    get jbuilder: 'v1/users/index.jbuilder' do
      @users = User.all
      @users = @users.where(partment: params[:partment]) if params[:partment].present?
    end

    params do
      requires :user, type: Hash do
        requires :email
      end
    end
    delete do
      user_params = declared(params)[:user]
      @user = User.find_by(email: user_params[:email])
      if !@user || @user.destroy
        { status: 1 }
      else
        { status: 0 }
      end
    end
  end
end
