class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :href, :ingredients, :thumbnail
end
