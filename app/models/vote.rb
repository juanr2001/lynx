class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :link
	validates :score, inclusion: { in: [-1,0,1] }
end
