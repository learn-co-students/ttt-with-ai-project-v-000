# require_relative "./players/human.rb"

# class Player < Human
class Player
	attr_reader :token
	attr_accessor :name

	def initialize(token)
		@token = token
		@name = name
	end
end