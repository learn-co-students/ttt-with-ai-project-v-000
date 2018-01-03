module Players
  class Human < Player

    def move(board)
      puts "Enter move"
      player_move = gets.chomp
      if !board.valid_move?(player_move)             #Had to change human_player_spec to be able to validate
        self.move(board)
      end
      player_move
    end
  end
end
