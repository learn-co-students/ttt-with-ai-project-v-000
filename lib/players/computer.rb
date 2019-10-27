module Players
  class Computer < Player
    def move(board)
      game = Game.new()
        # comp_move = board.cells.sort
        # binding.pry
        # myArray = ["stuff", "widget", "ruby", "goodies", "java", "emerald", "etc" ]
        # item = myArray[rand(myarray.length)]
        # comp_move = board.cells[rand(board.cells.length)]
        # board.cells[rand(board.cells.length)].select do |comp_move|

        board.cells.select do |computer_move|
          # computer_move = board.cells[rand(board.cells.length)]
          board.cells[rand(board.cells.length)]
          # comp_move = rand(1..9)

          board.cells[computer_move] = rand(1..9)
          binding.pry
          # board.cells[computer_move] = comp_move

          while board.full?

            if board.valid_move?(computer_move)

              board.update(computer_move, game.current_player)
              # board.cells.sort
              computer_move.to_s
            else
              move(board)
            end
          end
          # board.cells.sort
          # board.reset!
          # comp_move.to_s
          binding.pry
        end
    end
  end
end

# a.combination(n)
# computer_move = computer.move(board)
# Implement a `#move` method that accepts a board and returns the move the computer
# wants to make in the form of a 1-9 string. How the computer decides to make that
# move is up to you but it must be capable of returning a valid move at some point.
