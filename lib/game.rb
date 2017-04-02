require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[1]] == self.board.cells[win[2]] && (self.board.cells[win[0]] == "X" || self.board.cells[win[0]] == "O")
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    move = current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, current_player)
      self.board.display
    else
      self.turn
    end
  end

  def play
    self.turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic-Tac-Toe!\nWould you like to play with 0, 1 or 2 players?"
    player_count = gets.chomp

    if player_count == "0"
      puts "Which gameplay do you desire? Single/Wargames?"
      computer = gets.chomp.downcase
      if computer == "single"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).tap{|a|a.play}

      elsif computer == "wargames"
        x = 0
        o = 0
        100.times do
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).tap do |w| w.play
            if w.winner == "X"
              x += 1
            elsif w.winner == "O"
              o += 1
            end
            puts "X:#{x} O:#{o}"
            if x < o
              puts "O is the winner!"
            elsif x > o
              puts "X is the winner!"
            end
          end
        end
      end
    elsif player_count == "1"
      puts "Do you want to go first? y/n"
      first_move = gets.chomp.downcase
      if first_move == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).tap{|a|a.play}
      elsif first_move == "n"
        Game.new(Players::Computer.new("X"), Players::Human.new("O")).tap{|a|a.play}
      else
        puts "I don't understand, let's try again."
        self.start
      end
    elsif player_count == "2"
      Game.new.tap{|a|a.play}
    else
      puts "I don't understand, let's try again."
      self.start
    end

    puts "Care for another game? y/n"
    another = gets.chomp.downcase
    case another
    when "y"
      puts "Excellent, let's do this..."
      self.start
    when "n"
      puts "Thanks for playing! Hope to see you again!"
    else
      puts "I don't understand, begin the game again if you received this in error. Goodbye!"
    end
  end
end
