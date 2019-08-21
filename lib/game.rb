require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"),
    player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
   #binding.pry
  end

  def board
    @board
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      if board.cells[win_combo[0]] == "X" &&
        board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X" ||
        board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        return win_combo
      else
        false
      end
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def winner
    (won?.is_a? Array) ? board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter a move from 1-9"
    move = current_player.move(@board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
