require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns current player
  def current_player
    if board.turn_count.odd?
      @token = @player_2
    else
      @token = @player_1
    end
  end

  def over?
      #draw
      if self.draw?
        true
        #won
      elsif self.won?
        true
        #in-progress
      elsif !self.draw?
        false
      end
  end

  def won?
    player_1_won = false
    player_2_won = false
    #checks to see if there's a win for either player
    WIN_COMBINATIONS.each do |win_combo|
      if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]] == "X" && @board.cells[win_combo[2]] == "X"
        player_1_won = "X"
      elsif @board.cells[win_combo[0]] == "O" && @board.cells[win_combo[1]] == "O" && @board.cells[win_combo[2]] == "O"
        player_2_won = "O"
      end
    end
    player_1_won || player_2_won
  end

  def draw?
    #draw
    if !self.won? && @board.full?
      true
      #won
    elsif self.won?
      false
      #in-progess
    elsif !@board.full? && !self.won?
      false
    end
  end

  def winner
    if self.won?
      self.won?
    else
      nil
    end
  end

  #takes turns
  def turn
      move = self.current_player.move(@board)

    if @board.valid_move?(move)
      move
    else
      turn
    end
    @board.update(move, self.current_player)
    @board.display
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
