require_relative "../config/environment.rb"

class Player

	attr_reader :token
	attr_accessor :all

	@@all = []

	def initialize(token)
		@@all = [] if @@all.length > 1
		@token = token
		self.class.all << self
	end

	def self.all
		@@all
	end

end
