module API
  class RootAPI < Grape::API
    format :json
    formatter :json, Grape::Formatter::Jbuilder
    default_format :json

    helpers API::Helpers::SessionsHelper

    rescue_from ActiveRecord::RecordNotFound do
      error!({"error" => "404 Not Found"}, 404)
    end

    # mount routes
    mount API::V1::UsersAPI
    mount API::V1::MessagesAPI
    mount API::V1::UserAPI
  end
end
