class ApplicationController < ActionController::API
    before_action :authenticate

    def logged_in?
        !current_user.nil?
    end

    def current_user
        return unless auth_present?

        user = User.find(auth['id'])
        @current_user ||= user if user
    end

    private

      def authenticate
        render json: { error: 'Unauthorized' }, status: 401 unless logged_in?
      end

      def token
        return nil if request.env['HTTP_AUTHORIZATION'].nil?

        request.env['HTTP_AUTHORIZATION'].scan(/Bearer (.*)$/).flatten.last
      end
    
      def auth
        TokenAuthService.decode(token)
      end

      def auth_present?
        !token.nil?
      end
end
