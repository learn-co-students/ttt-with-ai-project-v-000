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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    if self.draw? || self.won?
      true
    end
  end

  def draw?
    self.board.turn_count == 9 && !self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] == @board.cells[array[1]] &&
      @board.cells[array[0]] == @board.cells[array[2]] &&
      @board.taken?(array[0]+1)
    end
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]]:nil
  end

  def turn
    current_move = self.current_player.move(@board)
    if !self.board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      @board.display
      puts "#{self.current_player.token} moved #{current_move}"
      @board.update(current_move, self.current_player)
      @board.display
    end

    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
  end
end
