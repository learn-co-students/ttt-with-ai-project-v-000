

module Players


  class Human < Player

    def move(board)
      puts "Make a move:"
      move = gets.strip
      move
    end
  end


end
