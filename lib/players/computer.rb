require 'pry'
module Players
  class Computer < Player

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

    def move(board)
      valid_moves = []
      move = ""
      board.cells.each_with_index do |space, index|
        valid_moves << (index + 1).to_s if board.valid_move?(index + 1)
      end
      if
        WIN_COMBINATIONS.any? do |combination|
          board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[0]] != self.token && board.cells[combination[0]] != " "
        end
        move = board.cells[combination[2]]
      elsif
         WIN_COMBINATIONS.any? do |combination|
           board.cells[combination[0]] == board.cells[combination[2]] && board.cells[combination[0]] != self.token && board.cells[combination[0]] != " "
         end
         move = board.cells[combination[1]]
      elsif
        WIN_COMBINATIONS.any? do |combination|
          board.cells[combination[1]] == board.cells[combination[2]] && board.cells[combination[1]] != self.token && board.cells[combination[1]] != " "
        end
        move = board.cells[combination[0]]
      else
        move = valid_moves.sample
      end
      move
    end
  end
end
