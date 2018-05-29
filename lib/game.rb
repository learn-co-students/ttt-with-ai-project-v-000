require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.odd? == true ? self.player_2 : self.player_1
  end

  def won?
   WIN_COMBINATIONS.detect do |win_combination|
     @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
     @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
     @board.taken?(win_combination[0]+1)
    end
  end
  
  def draw?
    @board.full? && !won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if won?
      @board.cells[self.won?.pop.to_i]
    else
      nil 
    end
  end

  def turn
    player = current_player
    move = player.move(self.board)
    binding.pry
    if !@board.valid_move?(move)
      move = player.move(self.board)
    else
      @board.update(move, player)
      @board.display
    end
  end 

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end