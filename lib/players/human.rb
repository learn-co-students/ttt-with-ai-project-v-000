require_relative "../player.rb"
module Players

  class Human < Player
    def move(board)
      puts "What move would you like to make?"
      input = gets
      return input
    end

  end


end