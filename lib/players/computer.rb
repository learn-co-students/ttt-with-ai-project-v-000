require "pry"

class Player::Computer < Player
  attr_accessor :board
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  def move(board)
    @board = board

    if winning_move != nil
      input = winning_move + 1
    elsif blocking_move != nil
      input = blocking_move + 1
    else
      input = (1..9).to_a.sample
      until board.taken?(input) == false
        input = (1..9).to_a.sample
      end
    end
    puts "It's now the computer's turn."
    input.to_s
  end
  def other
    token == "X" ? "O" : "X"
  end
  def winning_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      ((board.cells[combo[0]] == token && board.cells[combo[1]] == token) || (board.cells[combo[2]] == token && board.cells[combo[1]] == token) || (board.cells[combo[0]] == token && board.cells[combo[2]] == token)) && combo.any? {|cell| cell == " "}
    end
    if winning_row != nil
      winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
    end
  end
  def blocking_move
    winning_row = WIN_COMBINATIONS.find do |combo|
      ((board.cells[combo[0]] == other && board.cells[combo[1]] == other) || (board.cells[combo[1]] == other && board.cells[combo[2]] == other) || (board.cells[combo[2]] == other && board.cells[combo[0]] == other)) && combo.any? {|cell| cell == " "}
    end
    if winning_row != nil
      winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
    end
  end
end
