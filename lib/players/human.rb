module Players
  class Human < Player

    def move(board)
      puts "Enter move"
      player_move = gets.chomp
      if !(player_move.to_i >= 1 && player_move.to_i <= 9)
        self.move(board)
      end
      player_move
    end
  end
end
