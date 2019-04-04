lass Board
   attr_accessor :cells
   
   def reset!
     @cells = Array.new(9, " " )
   end
   
   def initialize
   reset!
  end
   
   def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
     @cells[input.to_i - 1]
  end
  
  def full?
    @cells.include?(" ") ? false : true
  end
  
  def turn_count
     @cells.count {|i| i == "X" || i == "O"}
  end
  
  def taken?(input)
    position(input) == "" || position(input) == " " ? false : true
  end
  
  def valid_move?(input)
   input.to_i.between?(1, 9) && !taken?(input)

    end
  def update(input, player)
      cells[input.to_i - 1] = player.token
  end
  
end
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
         puts "Cat's Game!"
   end
   end
   def start
    puts "Welcome to Tic Tac Toe - AI"
    puts "Enter number of players: (0-2)"
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
      if side == "X"
        @player_2 = Computer.new("O")
        @player_2.board = self.board
      elsif side == "O"
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

class Player
  attr_reader :token
  
  def initialize(token)
    @token = token
  end
end

module Players
  class Computer < Player
    attr_accessor :board, :game

     
   def move(board) 
      return rand(1..9).to_s
  end
end

class Human < Player
    
    def move(board)
     puts "#{@token}, please enter a move (1-9):"
    input = gets.strip
    end
    
  def self.select_token
    puts "Do you want to be 'X' or 'O'?"
    selection = gets.strip
    case token
    when "X"
      puts "You are Player 'X'!"
      "X"
    when "x"
      puts "You are Player 'X'!"
      "X"
    when "O"
      puts "You are Player 'O'!"
      "O"
    when "o"
      puts "You are Player 'O'!"
      "O"
    else
      puts "Please select 'X' or 'O'..."
      select_token
    end
  end 
  end
end

game = Game.new
game.start


