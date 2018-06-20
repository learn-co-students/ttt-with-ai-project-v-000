require 'pry'
class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil, player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
  end


  def current_player
    if self.board.turn_count%2==0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
  #  binding.pry
    m = []
    WIN_COMBINATIONS.each do
      |a,b,c|
        if self.board.cells[a] == self.board.cells[b] && self.board.cells[b] == self.board.cells[c] && self.board.cells[a]!= " "
        #  binding.pry
           m << [a,b,c]
        else
        end
      end
      if m == []
        return false
      else
        return m[0]
      end
  end

  def draw?
    !won? && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
  #  binding.pry

    if self.won? == false
      return nil
    elsif self.board.cells[self.won?[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

  def turn

  #  binding.pry
    self.current_player.move(self.board)

    if self.board.valid_move?(self.current_player.input)
        self.board.update(self.current_player.input, self.current_player)
    #    binding.pry
        self.board.display
    else
  #    binding.pry
        self.turn
    end
  end

  def play

    while self.over? == false
      self.turn
    end
  #  binding.pry
    if self.draw? == true
      puts "Cat's Game!"
    elsif self.won? != false
      puts "Congratulations #{self.winner}!"
    end
  end




end
