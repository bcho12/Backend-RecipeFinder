class FavoritesController < ApplicationController
	before_action :authorized, except: [:index, :create]

  def index
    @favorites = Favorite.all
    render json: @favorites.as_json, status: :ok
  end

	def create
		@favorite = Favorite.new(recipe_id: favorites_params['recipe_id'], user_id: favorites_params['user_id'])
		if @favorite.save
			render json: @favorite, status: :created
		else
			render json: @favorite.errors.full_messages, status: :unprocessable_entity
		end
  end

	# def create
  #   @favorite = Favorite.new(favorite_params)
  #   if @favorite && @favorite.valid?
  #     @favorite.save
  #     render json: @favorite, status: :created
  #   else
  #     render json: { errors: @favorite.errors.full_messages }, status: :not_accepted
  #   end
  # end

	# def destroy
  #   @favorite = Favorite.find(params[:id])
  #   if @favorite && @favorite.destroy
  #     render json: {}, status: :no_content
  #   else
  #     render json: { errors: @favorite.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

	def destroy
		currentUser = User.find(favorites_params[:user_id])
		@favorite = currentUser.favorites.find_by(recipe_id: favorites_params[:recipe_id])
			if @favorite.destroy
				render json: @favorite, status: :created
			else
				render json: @favorite.errors.full_messages, status: :unprocessable_entity
			end
	 end

  private

  def favorites_params
    params.permit(:user_id, :recipe_id)
  end

end
