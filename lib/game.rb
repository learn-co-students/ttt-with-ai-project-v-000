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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    combo_match = nil
    combo_match = WIN_COMBINATIONS.detect do |combo| #each combo is one of the win patterns
      combo.all?{|space| board.cells[space] == "X"} || combo.all?{|space| board.cells[space] == "O"}
      #checks to see if any of the combos patterns match for either "X" or "O"
      #if yes, returns the matching combo. If not, returns nil.
    end
    combo_match
  end

  def draw?
    !won? && board.full? #if board is full and has no player has won, returns true
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    input = current_player.move(board).to_i
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      self.turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
