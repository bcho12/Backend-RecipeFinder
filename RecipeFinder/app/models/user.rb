class User < ApplicationRecord
	has_many :favorites
  has_many :recipes, through: :favorites

  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true

	# def user_json
	# 	{
	# 		id: self.id,
	# 		username: self.username,
	# 		# favorites: self.favorites.all_json
	# 	}
	# end

	# def self.all_json
	# 	User.all.collect(&:to_json)
	# end

	# def self.user_json
	# 	User.all.collect { |u| u.user_json }
	# end


end
