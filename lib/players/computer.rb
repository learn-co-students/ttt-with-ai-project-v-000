module Players
  class Computer < Player
    def move(board)
      game = Game.new()
        board.cells.each do |computer_move|
          computer_move = rand(1..9)
            while board.full?
            if board.valid_move?(computer_move)
              board.update(computer_move, game.current_player)
            else
              move(board)
            end
          end
          computer_move.to_s
        end
    end
  end
end
