class AuthController < ApplicationController
    before_action :authorized, only: [:create]

    def create
      @user = User.find_by(name: user_login_params[:username])
			# @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password_digest])
            token = encode_token({ user_id: @user.id })
            render json: { user: @user, jwt: token }, status: :accepted
      else
            render json: { message: "Invalid name or password" }, status: :unauthorized
      end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password_digest)
    end
end
