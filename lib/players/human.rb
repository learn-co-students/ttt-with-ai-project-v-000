module Players
  class Human  < Player

  def move(board)
    i = nil
    until board.valid_move?(i)
      puts "Please make a valid move:"
      i = gets.chomp
    end
    board.update(i, self)
  end


    def are_we_human?
     "or are we dancers?"
    end
  end

end #class Human
