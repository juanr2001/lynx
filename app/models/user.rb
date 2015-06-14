class User < ActiveRecord::Base
	has_many :links

	has_many :comments

	has_many :votes
	has_many :links, through: :votes
end
