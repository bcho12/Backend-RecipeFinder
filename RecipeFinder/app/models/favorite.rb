class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :recipe

	def favorite_json
		{
			id: self.id,
			user_id: self.user_id,
			recipe_id: self.recipe_id,
			recipe_title: self.recipe.title,
			recipe_thumbnail: self.recipe.thumbnail
		}
	end

	def self.all_json
    Favorite.all.collect(&:favorite_json)
  end

end
