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
  
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def winning_player
    @board.turn_count % 2 != 0 ? @player_2.token : @player_1.token
  end
  
  def over?
    won? || draw?
  end
  
  def won?
    WIN_COMBINATIONS.each do |win|
      win_combo1 = @board.cells[win[0]]
      win_combo2 = @board.cells[win[1]]
      win_combo3 = @board.cells[win[2]]

      if win_combo1 == "X" && win_combo2 == "X" && win_combo3 == "X"
        return win
      elsif win_combo1 == "O" && win_combo2 == "O" && win_combo3 == "O"
        return win
      end
    end
    return false
  end
  
  def full?
    !@board.cells[0..8].any? {|move| move == "" || move == " "}
  end

  def draw?
    !won? && full? ? true : false
  end
  
  # Revisit this method. Works in old Tic Tac Toe and works here but not sure what is going on
  def winner
    if win_combo = won?
      return @board.cells[win_combo[0]]
    else
      return nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      @board.display
    else
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    won? ? (puts "Congratulations #{current_player.token}!") : (puts "Cats Game!")
  end
  
end