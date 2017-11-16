module Players
  class Human < Player

    def move(board_object)
      puts "Please enter your move"
      player_move = gets.chomp
    end

  end
end
