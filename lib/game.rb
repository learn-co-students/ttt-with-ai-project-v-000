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

  def initialize(player_1 = Human.new("X"), player_2=Human.new("O"), board=Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
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
    binding.pry
    input = self.current_player.move(board)
    while(!self.board.valid_move?(input))
      puts "Invalid move, please pick again"
      input = self.current_player.move(board)
    end
    binding.pry
    self.board.update(input, self.current_player)
  end

  def play
    until over?
      turn
    end
    if winner
      board.display
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
    #play_again_or_exit
  end

  def play_again_or_exit
    puts "Would you like to play again?
          Yes | No"
    input = gets.strip
    if input.downcase == "yes" || input.downcase == "y"
      game_option
    else input.downcase == "no" || input.downcase == "n" || input.downcase == "exit"
      exit!
    end
  end

end
