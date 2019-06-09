require './config/environment.rb'
class Game
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board, :player_1 , :player_2
  
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    if (board.turn_count == 0 || board.turn_count % 2 == 0)
      self.player_1
    else
      self.player_2
    end
  end
  
  def won?
    won = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|cell| self.board.cells[cell] == 'X'}
        won = combo
      elsif combo.all? {|cell| self.board.cells[cell] == 'O'}
        won = combo
      end
    end
    won
  end
  
  def over?
    over = false
    over = true if (self.won? || self.draw?)
    over
  end
  
  def draw?
    draw = false
    draw = true if (self.won? == false && self.board.full? == true)
    draw
  end
  
  def winner
    player = self.board.cells[self.won?[0]] if self.won?
    player
  end
    
  def turn
    self.board.turn_count % 2 == 0 ? player = self.player_1 : player = self.player_2
    choice = 0
    until self.board.valid_move?(choice)
      choice = player.move(self.board)
    end
    self.board.update(choice, player)
    self.board.display
  end
  
  def play
      until self.over?
        self.turn
      end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end

end