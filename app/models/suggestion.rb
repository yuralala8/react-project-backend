class Suggestion < ApplicationRecord
	belongs_to :user


	def self.vote_order
		Suggestion.all.order('vote_up - vote_down DESC')
	end
end
