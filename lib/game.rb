class Game
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  
  
  def initialize (player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new) 
    #need to set the default of each player to a Players::Human
    #this method is expecting Player instances
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  #binding.pry
  
  def current_player
    if self.board.turn_count.odd?
      @player_2
    else 
      @player_1
    end
    #binding.pry
  end
  
  def over?
    if self.won? || self.draw?
     return true
   elsif self.board.full? == false
     return false
   end
    #self.board.full? || self.winner
  end
  
  def won?
   if self.board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     return false
   else
     WIN_COMBINATIONS.any?{|combo|
       if self.board.taken?(combo[0])
         if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] == self.board.cells[combo[2]]
           return combo
         end
       end
       }
   end
  end
  
  def draw?
    if self.board.full? == true && self.won? == false 
      return true
    else
     return false
    end
  end
  
  def winner
    #binding.pry
    if draw? == false && won?.kind_of?(Array)
      return self.board.cells[self.won?[0]]
    else
      return nil
      #binding.pry
    end
    #expect(game.won?).to contain_exactly(2, 5, 8)
  end
  
  def turn
    puts "#{self.current_player} choose your next move:"
    #binding.pry
    choice = self.current_player.move(@board)
    while self.board.taken?(choice) == true || self.board.valid_move?(choice) == false
      choice = self.current_player.move(@board)
    end
    self.board.update(choice, self.current_player)
    return choice
    #Game turn changes to player 2 after first turn
  end
  
  def play
    #while self.winner == nil
    while self.over? == false && self.draw? == false
      self.turn
    end
      self.over?
      self.draw?
    #end
  end
end