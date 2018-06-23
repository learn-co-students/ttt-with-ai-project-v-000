require_relative '../game.rb'

class Player::Human < Player

    def move(board)
        puts "Where would you like to move?"
        gets.strip
    end







end
