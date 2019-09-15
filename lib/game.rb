require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :cells
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

  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  def won?
    WIN_COMBINATIONS.each do |combinations|
      if board.cells[combinations[0]] == "X" && board.cells[combinations[1]] == "X" && board.cells[combinations[2]] == "X"
        return combinations
      elsif board.cells[combinations[0]] == "O" && board.cells[combinations[1]] == "O" && board.cells[combinations[2]] == "O"
        return combinations
      end
    end
    false
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def current_player
    unclaimed = board.cells.find_all{|x| x==" "}
    if unclaimed.count.odd?
      player_1
    else
      player_2
    end
  end

  def draw?
    if !won? && !board.cells.include?(" ")
      true
    else
      false
    end
  end

  def winner
    if won?
      index = won?[0]
      board.cells[index]
    end
  end

  def turn
    position = current_player.move(board)
    board.valid_move?(position) ? board.update(position, current_player) : turn
    board.display
  end

  def play
    board.display
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
