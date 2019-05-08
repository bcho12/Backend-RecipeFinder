class RecipesController < ApplicationController
	before_action :authorized, except: [:index, :show, :fetch]


	def fetch

		@ingredient = request.headers['ingredient']
		@title = request.headers['title']
		@pageNumber = request.headers['pageNumber']

		@result = RestClient.get("http://www.recipepuppy.com/api/?q=#{@title}&p=#{@pageNumber}")

		@api_data = JSON.parse(@result.body)

		render json: @api_data

	end

	def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe
  end

	def create
		@recipe = Recipe.find_or_create_by!(title: recipe_params['title'], thumbnail: recipe_params['thumbnail'])
		if @recipe.save
			currentUser = User.find(recipe_params[:user_id])
			if currentUser.recipes.any?{|recipe| recipe['title'] === @recipe['title']}
				render json: @recipe, status: :ok
			else
				@recipe.users << currentUser
				render json: @recipe, status: :created
			end
		else
			render json: @recipe.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

		def recipe_params
			params.permit(:title, :thumbnail, :user_id)
		end

end
