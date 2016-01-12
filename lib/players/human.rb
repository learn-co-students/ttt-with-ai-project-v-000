require_relative '../player.rb'
require 'pry'

class Human < Player
	attr_accessor :name
	def move(arr)
		puts "What move would you like to make?"
		move = gets.chomp
		move
	end
	
end
