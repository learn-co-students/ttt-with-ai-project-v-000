require_relative '../lib/board.rb'

class Game

  attr_accessor :player_1, :player_2

  WIN_COMBINATIONS= [
      [0,1,2],  #top row
      [3,4,5], #middle row
      [6,7,8],  #bottom row
      [0,3,6],  #left column
      [1,4,7],  #middle column
      [2,5,8],  #right column
      [0,4,8],  #diagonal 1
      [6,4,2]   #diagonal 2
  ]

  def initialize(player_1 =  Human.new('X'), player_2 = Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def cells=(set_cells)
    @board.cells = set_cells
  end

  def cells
    (@board.cells == []) ? @board.cells : @board
  end

  def won?
    $winner = nil
    returnable = []
    WIN_COMBINATIONS.each do |win_combo|
      if @board.cells[win_combo[0]] == 'X' && @board.cells[win_combo[1]] == 'X' && @board.cells[win_combo[2]] == 'X'
        $winner = player_1.token
        returnable = win_combo
        break
      elsif @board.cells[win_combo[0]] == 'O' && @board.cells[win_combo[1]] == 'O' && @board.cells[win_combo[2]] == 'O'
        $winner = player_2.token
        returnable = win_combo
        break
      else
        returnable = false
      end
    end
    returnable
  end
  #
  def draw?
    true if @board.full? == true && won? == false
  end
  #
  def over?
    true if draw? || won?
  end
  #
  def winner
    over?
    $winner
  end
  #
  #
  #
  def current_player
    player = @board.turn_count
    player.even? ? player_1 : player_2

  end

  def turn
    spot = current_player.move(@board)
    !@board.valid_move?(spot) ? turn : @board.update(spot, current_player)
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{$winner}!"
    end
  end

end




