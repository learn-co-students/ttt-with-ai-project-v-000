class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [2,4,6]]
  
  def initialize(p1=Players::Human.new("X"), p2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = p1
    @player_2 = p2
  end
  
  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.find do |i|
      board = [@board.cells[i[0]], @board.cells[i[1]], @board.cells[i[2]]]
      board.all?{|x| x=="X"} || board.all?{|x| x=="O"}
    end
  end
  
  def draw?
    !self.won? && @board.full?
  end
  
  def over?
    self.won? || self.draw?
  end
  
  def winner
    self.won? ? @board.cells[self.won?[0]] : nil
  end
  
  def turn
    move = current_player.move(@board)
    @board.valid_move?(move) ? @board.update(move, current_player) : turn
  end
  
  def play
    until over?
      turn 
    end
    @board.display
    if won? 
      puts "Congratulations #{winner}!" 
    else 
      puts "Cat\'s Game!"
    end
  end
  
  def self.greeting
    puts "Welcome to Tic Tac Toe!"
  end
  
  def self.start
    puts "How many player(s) are going to play the game?"
    no_player = gets.strip.to_i
    case no_player
      when 0
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      when 1
        valid = false
        until valid do 
          puts "Would you like to go first?"
          input = gets.strip.downcase
          if input == "y" || input == "yes"
            valid = true
            game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
          elsif input == "n" || input == "no"
            valid = true
            game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          end
        end
      when 2
        game = Game.new
      else
        puts "Invalid number of player(s)"
        self.start
    end
    game.play
    restart?
  end
  
  def self.restart?
    valid = false
    until valid do 
      puts "Would you like to play again?"
      input = gets.strip.downcase
      if input == "y" || input == "yes"
        valid = true
        start
      elsif input == "n" || input == "no"
        valid = true
      end
    end
  end
end