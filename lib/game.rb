require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS=[
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]]


  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    #is there a better way? less literal?
    # def initialize(player_1, player_2, board)
    @board = board
    @player_1 = player_1
    @player_2 = player_2

  end

  def current_player
    counter = 0
    board.cells.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
      counter % 2 == 0 ? player_1 : player_2
  end

  def over?
    if won? || draw?
      true
    end
  end

  def won?

    WIN_COMBINATIONS.detect do |win|

    if position_taken?(win[0]) && position_taken?(win[1]) && position_taken?(win[2]) && board.cells[win[0]] ==
      board.cells[win[1]] && board.cells[win[0]] == board.cells[win[2]]
      [win[0],win[1], win[2]]
    end
    end
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def full?
    unless board.cells.include?(" ")
      return true
    end
  end

  def position_taken?(location)
    !(board.cells[location].nil? || board.cells[location] == " ")
  end

  def winner
    if win = won?
      return board.cells[win[0]]
    else
       nil
    end
  end

  def move (position, player)
    board.cells[position.to_i-1] = player
  end

  def turn
      move = current_player.move(@board)

      if board.valid_move?(move)
        board.update(move, current_player)
      else
        "invalid"
        turn
      end

    board.display
  end

  def play
    until over?
      turn
    end
    if won?
      winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def self.run
    puts "Shall we play a game?"
    puts "Who is playing?"
    puts "Head to Head, Please Enter 2"
    puts "One Player, Please Enter 1"
    puts "Watch Me Play, Please Enter 0"
    puts "To Quit, Enter exit"
    user_input = gets.strip
    until user_input == "exit"

      if user_input == "0"
        zero_player_game
        continue
        user_input = gets.strip

      elsif user_input == "1"
        one_player_game
        continue
        user_input = gets.strip

      elsif user_input == "2"
        two_player_game
        continue
        user_input = gets.strip

      elsif user_input == "exit"
        goodbye

      elsif user_input == "wargames"
        counter = 0
        100.times do
          counter += 1
          puts "Game #{counter}"
          zero_player_game
          sleep(12.0/24.0)


        end
        continue
        user_input = gets.strip



      else
        puts "Hmm.  Something is amiss.  Please try again."
        user_input = gets.strip
      end
    end
  end

  def self.zero_player_game
    self.new(player_1 = Computer.new("X"), player_2 = Computer.new("O"), board = Board.new).play
  end

  def self.one_player_game
    puts "Choose your weapon: X or O. If choose X, you can go first."
        user_input = gets.strip
          until user_input == "X" || user_input == "O" || user_input == "x" || user_input == "o"
            puts "X or O only, please!"
            user_input = gets.strip
          end
          if user_input == "X" || user_input == "x"
            self.new(player_1 = Human.new("X"), player_2 = Computer.new("O"), board = Board.new).play
          elsif user_input == "O" || user_input == "o"
            self.new(player_1 = Computer.new("X"), player_2 = Human.new("O"), board = Board.new).play
          end
  end

  def self.two_player_game
    puts "X will be the first to play. You two can take turn from here. Have fun!"
    self.new(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new).play
  end

  def self.continue
    puts "Play again?  Please enter number of players or exit."
    puts "0 | 1 | 2 ------------------------ exit"
  end

  def self.goodbye
    puts "Goodbye, Joshua."
  end

end