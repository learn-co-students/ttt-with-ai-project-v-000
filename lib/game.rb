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
   #if self.board.cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # return false
   #else
     cell = self.board.cells
     brd = self.board
     WIN_COMBINATIONS.any?{|combo|
       #if self.board.taken?(combo[0])
         #if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] == self.board.cells[combo[2]]
         if (brd.taken?(combo[0] + 1) && brd.taken?(combo[1] + 1) && brd.taken?(combo[2] + 1)) && (cell[combo[0]] == cell[combo[1]]) && (cell[combo[0]] == cell[combo[2]])
           return combo
         end
         #end
       #end
       
       }
   #end
   return false
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
    if self.draw? == false && self.won? != false
      #game.board.cells = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
      return self.board.cells[self.won?[0]]
    else
      return nil
      #binding.pry
    end
    #expect(game.won?).to contain_exactly(2, 5, 8)
  end
  
  def turn
    puts "#{current_player.token} choose your next move:"
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
      self.board.display
    end
      if self.won?.kind_of?(Array)
        #binding.pry
        puts "Congratulations #{self.winner}!"
      elsif self.draw? == true
        return puts "Cat's Game!"
      end
    #end
  end
  
  def self.start
    choice = gets.strip
    if choice == 0
      ai = Game.new(player_1=Players::Computer.new("X"),player_2=Players::Computer.new("O"))
      while over? == false
        ai.play
        board.display_board
      end
      
    elsif choice == 1
      one = Game.new
      one.player_2 = Computer.new("O")
      one.board.display
      one.play
    else
      two = Game.new
      two.board.display
      two.play
    end
  end
end