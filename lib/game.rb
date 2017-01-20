require 'pry'

class Game

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

  # spec requires arguments to be passed in in this order
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    # test calls on player.token, changed true/false statements to player_1/player_2
      @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      #binding.pry
      @board.cells[win[0]] == @board.cells[win[1]] &&
      @board.cells[win[1]] == @board.cells[win[2]] &&
      @board.taken?(win[0]+1) # fatal w/o +1, breaks #winner
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    draw? || won?
  end

  def winner
    #binding.pry
    #thanks Avi and Brad!
    # first get the combo that won
    if winning_combo = won?
    # take first position from winning combo and thats the winner
    @board.cells[winning_combo[0]]
    end
  end

  def turn
    # binding.pry
    # check for valid move
    # repeat if failed validation
    current_move = current_player.move(board)
    if !@board.valid_move?(current_move)
      turn
    else
      # make move and switch current_player
      @board.update(current_move, current_player)
      @board.display
    end
  end

  def play
    until over?
     turn
    end
    if won?
     puts "Congratulations #{winner}!"
    elsif draw?
     puts "Cat's Game!"
   end
  end

  def start
    puts "Welcome to TicTacToe!\n"
    play_again = 'y'
    while play_again == 'y'.downcase || play_again == 'yes'.downcase
      puts "How many human players?\n0\n1\n2"
      input = gets.strip

      if input == 0
        puts "This should be fun."
        sleep 1.5
        player_1 = Players::Computer.new('X')
        player_2 = Players::Computer.new('O')
        self.new(player_1, player_2).play
      elsif input == 1
        puts "Would you like to go first? (First player = X)"
        input == gets.strip
        if input == 'yes'.downcase || input == 'y'.downcase
          player_1 = Players::Human.new('X')
          player_2 = Players::Computer.new('O')
          self.new(player_1, player_2).play
        elsif input == 'no'.downcase || input == 'n'.downcase
          player_1 = Players::Computer.new('X')
          player_2 = Players::Human.new('O')
          self.new(player_1, player_2).play
        end
      elsif input == 2
        player_1 = Players::Human.new('X')
        player_2 = Players::Human.new('O')
        self.new(player_1, player_2).play
      end
      puts "Would you like to play again?\nYes\nNo"
        play_again = gets.strip
    end
    puts "Thanks for playing!"
    sleep 1
    abort
  end
end
