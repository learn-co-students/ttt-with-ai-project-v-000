module Players

  class Human < Player

    def move(board)
      token = get_token(board)

      puts "ENTER A MOVE, PLAYER #{token}:"
      a = gets.chomp
      #puts "    just got input '#{a}' from player"
      a
    end

    def get_token(board)
      current_turn = board.turn_count + 1

      if current_turn.odd?
        token = "X"
      else
        token = "O"
      end
      token
    end


  end

end
