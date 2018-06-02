class Game 
  include Players
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
  def initialize(*args)
    if args[0] 
      self.player_1 = args[0]
    else 
      self.player_1 = Human.new("X")
    end 
    
    if args[1]
      self.player_2 = args[1]
    else
      self.player_2 = Human.new("O")
    end
    
    if args[2] 
      @board = args[2]
    else 
      @board = Board.new 
    end
  end 
  
  def player_1=(token)
    @player_1 = token
  end
  
  def player_2=(token)
    @player_2 = token
  end
  
  def current_player 
    self.board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
      if self.board.taken?(combo[0] + 1) && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
        return combo
      end
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def full?
    self.board.cells.all?{|square| square != " " }
  end

  def over?
    #binding.pry 
    won? || draw?
  end

  def winner
    #binding.pry 
    if combo = won?
      self.board.cells[combo[0]]
    else
      nil
    end
  end


def turn 
  valid = FALSE
  while valid == FALSE 
    move = self.current_player.move(self.board.cells)
    #binding.pry 
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
      valid = TRUE
    end
    self.board.display
  end
end 

def play 
  turn until over?
  puts "Congratulations #{winner}!" if winner
  puts "Cat's Game!" if draw?
  puts "Would you like to play again (yes or no)?"
  play_again = gets.strip until play_again == "yes" || play_again == "no"
  play_again == "yes" ? Game.start : "Goodbye"
end

def self.start 
  puts "WELCOME TO TIC-TAC-TOE!!!"
  puts "Would you like to play a 0, 1, or 2 player game?"
  input = gets.strip until input == "0" ||  input == "1" || input == "2" || input == "wargames"
  if input != "wargames"
    puts "Great! Who goes first? 1 or 2?"
    p1 = gets.strip until p1 == "1" || p1 == "2"
  end
  Board.new.display

  case input 
    when "0"
      Game.new(Computer.new("X"), Computer.new("O")).play
    when "1"
      if p1 == "1"
        Game.new(Human.new("X"), Computer.new("O")).play
      else
        Game.new(Computer.new("X"), Human.new("O")).play
      end
    when "2"
      Game.new.play
    when "wargames"
      Game.new(Computer.new("X"), Computer.new("O")).wargames
  end
end 

def wargames 
  wins = 0 
  draws = 0 
  100.times do 
    turn until over?
    #binding.pry 
    wins += 1 if winner
    draws += 1 if draw?
    #binding.pry
    self.board.reset!
  end
  puts "Wins = #{wins} - Draws = #{draws}"
  puts "Would you like to play again (yes or no)?"
  play_again = gets.strip until play_again == "yes" || play_again == "no"
  play_again == "yes" ? Game.start : "Goodbye"
end

end

