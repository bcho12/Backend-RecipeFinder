class UsersController < ApplicationController
	# before_action :authorized, except: [:index, :show, :create]
	skip_before_action :authorized, only: [:show, :create]

  def index
    @users = User.all
    render json: @users.as_json, status: :ok
  end

	def show
		@user = User.find(params[:id])
    render json: @user.as_json(:include => :recipes), status: :ok
  end

	def profile
		# binding.pry
		render json: { user: current_user.user_json }
		# render json: { user: current_user.user }
	end

	# def create
	# 	@user = User.new(user_params)
	# 	if @user.save
	# 		@token = encode_token(user_id: @user.id)
	# 		render json: { user: @user, jwt: @token }, status: :created
	# 	else
	# 		render json: @user.errors.full_messages, status: :unprocessable_entity
	# 	end
	# end

	def create
		@user = User.new(user_params)
		if @user && @user.valid?
				@user.save
				@token = encode_token(user_id: @user.id)
				render json: { user: @user, jwt: @token }, status: :created
		else
				render json: { error: @user.errors.full_messages }, status: :not_acceptable
		end
end

  private

  def user_params
    params.require(:user).permit(:username, :password_digest, :password_confirmation)
  end

  # def find_user
  #   @user = User.where(username: params[:id])
  # end

  # def show
	# 	@user = User.find(params[:id])
  #   render json: @user.as_json(:include => :recipes), status: :ok
  # end
	#
	# def create
	# 	@user = User.new(user_params)
	# 	if @user.save
	# 		@token = encode_token(user_id: @user.id)
	# 		render json: { user: @user, jwt: @token }, status: :created
	# 	else
	# 		render json: @user.errors.full_messages, status: :unprocessable_entity
	# 	end
	# end
	#
  # private
	#
  # def user_params
  #   params.permit(:username, :password_digest)
  # end
	#
	# def find_user
 	#  @user = User.where(name: params[:id])
  # end

end
