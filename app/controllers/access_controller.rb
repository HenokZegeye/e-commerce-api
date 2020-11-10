class AccessController < ApplicationController
  skip_before_action :authenticate, only: [:login]

  def login
    user = User.find_by(email: auth_params[:email])
    if user
      if user.authenticate(auth_params[:password])
        payload = { id: user.id, email: user.email }
        jwt = TokenAuthService.issue(payload)
        render json: { token: jwt }
      else
        render json: { error: 'Invalid username or password' }, status: 400
      end
    else
      render json: { error: 'User does not exist' }, status: 400
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end