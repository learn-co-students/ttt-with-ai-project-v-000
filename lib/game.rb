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

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # this is the current player whose move it currently is
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if ((@board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X") || 
        (@board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" && @board.cells[win_combination[2]] == "O"))
        return win_combination
      end
    end
    return false
  end

  def draw?
    won? == false && board.full?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn  
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      @board.display
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
