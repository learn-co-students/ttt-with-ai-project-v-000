module Players
  class Human < Player

    def move(board)
      print "Please enter 1-9: "
      player_move = gets.strip
    end

  end
end
 
