require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  #extend Players::Human

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all?{|index| self.board.cells[index] == "X"}
        win_combination
      elsif win_combination.all?{|index| self.board.cells[index] == "O"}
        win_combination
      else
        false
      end
      #binding.pry
    end
  end


  def over?
    won? || draw?
  end


  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      array = won?
      board.cells[array.first]
    end
  end

  def turn
    player = current_player
    input = player.move(board)
    if board.valid_move?(input)
      board.update(input, player)
      board.display
    else
      turn
    end
  end

  def play
    turn until over?
    if winner == nil
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
      play_again
    end
  end

  def play_again
    puts "Would you like to play again? y/n"
    input = gets.strip

    play_again unless ["y", "n"].include?(input)
    start  unless input == "n"
  end

  def start
    puts "How do you want to play? 1 to play against the computer, 2 to play"
    puts "against yourself or another human, and 3 to watch the computer play"
    puts "itself!"
    input = gets.strip
    if input == "1"
      Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O")).play
    elsif input == "2"
      Game.new.play
    elsif input == "3"
      Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O")).play
    end
  end

end
