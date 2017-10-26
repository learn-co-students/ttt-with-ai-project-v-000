require 'pry'
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
    [6,4,2]
  ]

  def initialize(player_1 = nil, player_2=nil, board=nil)
    self.player_1 = (!player_1) ? Human.new("X") : player_1
    self.player_2 = (!player_1) ? Human.new("O") : player_2
    self.board = (!board) ? Board.new : board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if(won?)
      self.board.cells[won?[0]]
    end
  end

  def turn
    input = self.current_player.move(board)
    while(!self.board.valid_move?(input))
      puts "Invalid move, please pick again"
      input = self.current_player.move(board)
    end
    self.board.update(input, self.current_player)
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start_game
    game_option
    who_goes_first

  end

  def game_option
    puts "Select game option:
      1 - Computer vs Computer
      2 - You vs Computer
      3 - You vs another Player"
      input = gets.strip
      #binding.pry
      if input.to_i == 1 || input.to_i == 2 || input.to_i == 3
        @user_input
      else
        puts "#{input} is an invalid entry."
        game_option
      end
    end



  def who_goes_first
    puts "Who do you want to go first and be X:
      1 - Computer
      2 - You
      3 - Friend"
      input = gets.strip
      if @user_input == 1
        start_game
      elsif input.to_i == 2 || input.to_i == 3
        input
      else
        puts "#{input} is an invalid entry."
        who_goes_first
      end
    end


end
