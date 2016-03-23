require 'pry'
class Game
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom Row
    [0,3,6],  # Left Column
    [1,4,7], # Middle Column
    [2,5,8],  # Right Column
    [0,4,8], # Top Left Diagonal
    [6,4,2]  # Top Right Diagonal
  ]
  attr_accessor :board, :player_1, :player_2
  def initialize(player1 = Player::Human.new("X"), player2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end
  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
      @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
      self.board.taken?(win_combination[0])
    end
  end
  def draw?
    self.board.full? && !self.won? ? true : false
  end
  def over?
    won? || draw?
  end

  def winner
    if won? != nil
      if self.board.cells[won?.first] == self.player_1.token
        self.player_1.token
      elsif self.board.cells[won?.first] == self.player_2.token
        self.player_2.token
      else
        nil
      end
    end
  end


  def turn
    player = current_player
    move = player.move(@board)
    if !@board.valid_move?(move)
      turn
    else
      @board.display
      @board.update(move, player)
      puts "Updating Board: #{player.token} completed move at #{move}."
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
