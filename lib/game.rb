require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    won? || board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      board_combo = []
      combo.each do |index|
        board_combo << board.cells[index]
      end
      if board_combo.uniq.count <= 1
        if board_combo.uniq[0] == "X" or board_combo.uniq[0] == "O" #if you ever run into a winning combo, break out of loop
          return board_combo.uniq
        end
      end
    end
    return false # if you make it through the entire loop with no luck, it's false
  end

  def draw?
    !won? && over?
  end

  def winner
    if won?
      won?[0]
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      puts "This is invalid. Please try again."
      self.turn
    end
    board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
