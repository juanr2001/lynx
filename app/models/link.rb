class Link < ActiveRecord::Base
	belongs_to :user
	
	has_many :comments

	has_many :votes
	has_many :users, through: :votes

	def total_votes 
		votes = self.votes
		score = 0 
		votes.each do |vote|
			score += vote.score
		end
		score
	end
	
end
