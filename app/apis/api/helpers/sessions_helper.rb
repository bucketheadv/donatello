module API
  module Helpers
    module SessionsHelper
      def logger
        env['app.logger'] # RootAPI.logger
      end

      def warden
        env['warden']
      end

      def current_user
        env['warden'].user
      end

      def authenticate_user!
        error!({"error" => "403 Unauthorized"}, 403) unless current_user
      end

      def render_error(errors, code)
        error!({"error" => errors}, code)
      end
    end
  end
end
