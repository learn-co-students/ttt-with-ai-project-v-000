#!/usr/bin/env ruby

require_relative '../config/environment'

def start
	puts "Hello! Welcome to Tic-Tac-Toe"

	puts "What kind of game do you want to play? 0,1, or 2?"

	input = gets.strip

	case input
	when 0.to_s
		puts "You'll just watch computers play."
	when 1.to_s
		puts "You'll play against a computer."
	when 2.to_s
		puts "You'll play against a friend."
	else
		start
	end

	puts "Who wants to go first and be 'X'?"
	input = gets.strip

end



