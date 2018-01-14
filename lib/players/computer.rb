module Players
  class Computer < Player
    def move(board)
      case self.token
      when "X"
        if board.valid_move?("1")
          "1"
        elsif board.valid_move?("5")
          "5"
        elsif board.valid_move?("9")
          "9"
        else
          move = rand(0..10)
      if board.valid_move?(move)
        move.to_s
      else
        self.move(board)
      end
    end
        when "O"
          if board.valid_move?("1")
            "1"
            elsif board.valid_move?("5")
            "5"
            elsif board.valid_move?("9")
            "9"
          else
           move = rand(0..10)
      if board.valid_move?(move)
        move.to_s
      else
        self.move(board)
        end
      end
    
    end
  end
end
end


#move = rand(0..10)
    #  if board.valid_move?(move)
      #  move.to_s
    #  else
    #    self.move(board)
    #  end