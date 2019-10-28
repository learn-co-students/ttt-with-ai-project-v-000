module Players
  class Computer < Player
    def move(board)
      game = Game.new()
        board.cells.map do |computer_move|
          computer_move = board.cells[rand(board.cells.length)]
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
        # computer_move = board.cells[rand(board.cells.length)]
        # myArray = ["stuff", "widget", "ruby", "goodies", "java", "emerald", "etc" ]
        # item = myArray[rand(myArray.length)]
