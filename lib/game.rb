class Game
  
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]
  
  def initialize (player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new) 
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if self.board.turn_count.odd?
      @player_2
    else 
      @player_1
    end
  end
  
  def over?
    if self.won? || self.draw?
     return true
   elsif self.board.full? == false
     return false
   end
  end
  
  def won?
     cell = self.board.cells
     brd = self.board
     WIN_COMBINATIONS.any?{|combo|
         if (brd.taken?(combo[0] + 1) && brd.taken?(combo[1] + 1) && brd.taken?(combo[2] + 1)) && (cell[combo[0]] == cell[combo[1]]) && (cell[combo[0]] == cell[combo[2]])
           return combo
         end
       }
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
    if self.draw? == false && self.won? != false
      return self.board.cells[self.won?[0]]
    else
      return nil
    end
  end
  
  def turn
    puts "#{current_player.token} choose your next move:"
    choice = self.current_player.move(@board)
    while self.board.taken?(choice) == true || self.board.valid_move?(choice) == false
      choice = self.current_player.move(@board)
    end
    self.board.update(choice, self.current_player)
    return choice
  end
  
  def play
    while self.over? == false && self.draw? == false
      self.turn
      self.board.display
    end
      if self.won?.kind_of?(Array)
        puts "Congratulations #{self.winner}!"
      elsif self.draw? == true
        return puts "Cat's Game!"
      end
  end
  
  def self.start
    choice = gets.strip
    if choice == "0"
      ai = Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
      #binding.pry
      while ai.over? == false
        ai.play
        ai.board.display
      end

    elsif choice == "1"
      one = Game.new
      one.player_2 = Players::Computer.new("O")
      while one.over? == false
        one.play
        one.board.display
      end
      
    else
      two = Game.new
      two.board.display
      two.play
    end
  end
end