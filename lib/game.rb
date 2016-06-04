require './config/environment.rb'
require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1; @player_2 = player_2; @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
   
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        position_1
      else
        nil
      end
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw? || self.board.full?
  end

  def winner
    if winning_combo = won?
      if @board.cells[winning_combo.first] == "X"
        @winner = player_1
      elsif @board.cells[winning_combo.first] == "O"
        @winner = player_2
      end
    end
  end

  def turn
    player = self.current_player
    current_move = player.move(self, self.board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
    end
  end


  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner.token}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


  def get_available_moves
    (0..8).select { |i| self.board.cells[i] == " "}.collect{|i| (i + 1).to_s}
  end

end