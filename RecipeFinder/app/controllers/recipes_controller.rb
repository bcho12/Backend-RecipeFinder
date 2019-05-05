class RecipesController < ApplicationController
	before_action :authorized, except: [:index, :show, :fetch]


	def fetch

		@ingredient = request.headers['ingredient']
		@title = request.headers['title']
		@pageNumber = request.headers['pageNumber']

		# @result = RestClient.get("http://www.recipepuppy.com/api/?i=#{@ingredient}")
		@result = RestClient.get("http://www.recipepuppy.com/api/?q=#{@title}&p=1")

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

	# def create
	#
	# end

end
