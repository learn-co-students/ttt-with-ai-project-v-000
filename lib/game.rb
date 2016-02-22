require "pry"
class Game
  attr_accessor :player_1, :player_2, :board

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

def turn
  puts "Please enter 1-9:"
  move = self.current_player.move(@board)
  if @board.valid_move?(move)
    @board.update(move, self.current_player)
    @board.display
  else
    puts "That was an invalid move!"
    turn
  end
end

  def play
    until over?
      turn
      won?
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

def won?
    WIN_COMBINATIONS.any? do |arr|
      win_index_1 = arr[0]
      win_index_2 = arr[1]
      win_index_3 = arr[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || 
         position_1 == "O" && position_2 == "O" && position_3 == "O"
         return arr
      else
        false
      end
    end
end

def draw?
  if !(won?) && @board.full?
    true
  elsif !won? && !@board.full?
    false
  elsif won?
    false
  end
end

def over?
  (won? || draw? || @board.full?) ? true : false
end

def winner
  if !won?
    nil
  elsif won?
    win = won?
    char = @board.cells[win[0]]
    if char == "X"
      "X"
    elsif char == "O"
      "O"
    end
  end
end


  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def start
    puts "Welcome to Tic-Tac_Toe with AI"
    puts "What kind of game would you like to play 0, 1, or 2 player?"
    type = gets.strip
    if type == "0"
      game = Game.new(@player_1 = Player::Computer.new("X"), @player_2 = Player::Computer.new("O"))
    elsif type == "1"
      game = Game.new(@player_1 = Player::Human.new("X"), @player_2 = Player::Computer.new("O"))
    elsif type == "2"
      game = Game.new(@player_1 = Player::Human.new("X"), @player_2 = Player::Human.new("O"))
    end
    self.play
    if self.over?
      puts "Would you like to play again?"
      answer = gets.strip.downcase
      if answer == "yes"
        self.board.reset!
        self.start
      elsif answer == "no"
        exit
      end
    end
  end
end
