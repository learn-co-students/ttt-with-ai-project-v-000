require_relative "../player.rb"

class Players

  class Human < Player

    def move(board)
      puts "Where would you like to place your move player #{self.token}? (a number between 1 and 9)"
      puts ""
      input = gets.chomp
      input
    end

  end

end
