require 'pry'

class Game 
  attr_accessor :player_1, :player_2, :board

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



  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end


  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
   winner != nil ? true : false
  end

  def draw?
    board.full? && !won? ? true : false
  end

  def winner 
    WIN_COMBINATIONS.detect do |y|
      
        if @board.cells[y[0]] == "X" && @board.cells[y[1]] == "X" && @board.cells[y[2]] == "X"
          return "X"
        elsif @board.cells[y[0]] == "O" && @board.cells[y[1]] == "O" && @board.cells[y[2]] == "O"
          return "O"
        else
          nil
        end
      end
    
  end

  def turn
      puts "Please select 1-9"
      input = current_player.move(board)
     

      if board.valid_move?(input)  
        board.update(input, current_player)
      else 
        turn 
      end
    board.display
  end

  def play 
    until over?
      turn 
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


  def start

    puts "Welcome to TicTacToe!"

    puts "Would you like to play a 0, 1, or 2 player game?"

    input = gets.chomp

    if input == "0"
      game = Game.new(player_1=Player::Computer.new("X"), player_2=Player::Computer.new("O"))
    elsif input == "1"
      game = Game.new(player_1=Player::Human.new("X"), player_2=Player::Computer.new("O"))
    elsif input == "2"
      game = Game.new(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"))
    end
    game.play 
    play_again
  end

  def play_again
    puts "Would you like to play again? y/n"
    input = gets.chomp.downcase

    if input == "y"
      start
    elsif input == "n"
      board.reset!
    else
      play_again
    end
  end


end #end class Game