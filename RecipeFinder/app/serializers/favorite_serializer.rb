class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id
end
