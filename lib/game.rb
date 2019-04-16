require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    
  
    def current_player
      @board.turn_count.odd? ? @player_2 : @player_1
    end
   def won? 
    
    winner = ""
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|i| @board.cells[i] == "X"} || win_combo.all? {|i| @board.cells[i] == "O"}
        winner = win_combo
      end
    end
    winner != "" ? winner : FALSE
   end
   
   def draw?
    !won? && board.full? == true ? true : false
   end
   
   def over?
   won? != false || draw? == true ? true : false
  end
  
  def winner
    won? ?  @board.cells[won?[0]] : nil
   end

def turn 
  input = current_player.move(@board)
  if @board.valid_move?(input)
    @board.update(input, current_player)
  else 
    turn
end
end

def play
   while !over?
 turn
 end
   if won?
     puts "Congratulations #{winner}!"
     elsif draw?
         puts "Its a Draw!"
   end
     
    ## CLI Method below ##
   def start
    puts "Welcome to Tic Tac Toe -AI versions"
    puts "Enter number of players: (0, 1, 2)"
    answer = gets.chomp
    case answer
    when "0"
      puts "Enjoy the game between 2 Computers"
      @player_1 = Computer.new("X")
      @player_1.board = self.board
      @player_2 = Computer.new("O")
      @player_2.board = self.board
      self.play
    when "1"
      puts "Choose your side: X or O"
      side = gets.chomp
      if side == "X"||"x"
        @player_2 = Computer.new("O")
        @player_2.board = self.board
      elsif side == "O"||"o"
        @player_1 = Computer.new("X")
        @player_1.board = self.board
      else
        puts "Invalid entry. Game restarting..."
        self.start
      end
      puts "Game starting..."
      @board.display
      self.play
    when "2"
      puts "Let's begin"
      self.play
    else
      puts "Invalid entry. Game restarting..."
      self.start
    end
  end

end
     
  ### Checking for winner ###
  
  
  def winchecker

    grid = []
    holder = []

    WIN_COMBINATIONS.each do |x|

    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]

    holder << @board.cells[win_index_1]
    holder << @board.cells[win_index_2]
    holder << @board.cells[win_index_3]


      grid << holder
      holder = []
    end

    counter = 0
    combo = []
    grid.each do |xxx|
      y = xxx.detect{ |e| xxx.count(e) > 1 }
      if y == "X" && xxx.count(" ") == 1
        combo = xxx
        break
      elsif y == "O" && xxx.count(" ") == 1
        combo = xxx
        break
      else
        counter+=1
      end
    end

    if counter > 7
      target_index = @board.cells.rindex(" ")
      else
      blank_index = combo.index(" ")
      target_index = WIN_COMBINATIONS[counter][blank_index]
    end

    target_index+=1

    end
  end





   
