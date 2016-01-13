require 'pry' 

class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [0,4,8], 
  [6,4,2]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && 
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.cells[combo[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    @board.full? 
  end

  def winner
    if won?
      @win_combo = WIN_COMBINATIONS.find do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && 
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.cells[combo[0]] != " "
      end
      @board.cells[@win_combo.first]
    else
      nil
    end
  end


  def turn
    user_input = self.current_player.move(@board)
    if @board.valid_move?(user_input)
      @board.update(user_input, current_player)
    else
      puts "Invalid move! Silly!"
      self.turn
    end
    @board.display
  end

  def play
    "Sup, brah! Wanna play a game? Make your move!"
    until over? || draw? || won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
