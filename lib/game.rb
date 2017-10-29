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
    if !computer_round_0?
      board.display
      puts "Please enter 1-9"
    end
    input = self.current_player.move(board)
    while(!self.board.valid_move?(input))
      binding.pry
      puts "Invalid move, please pick again"
      input = self.current_player.move(board)
    end
    self.board.update(input, self.current_player)
  end

  def computer_round_0?
    if player_1.is_a?(Computer) && player_2.is_a?(Computer) && board.turn_count == 0 || player_1.is_a?(Computer) && board.turn_count == 0
      true
    end
  end

  def play
    until over?
      turn
    end
    if winner
      board.display
      puts "Congratulations #{winner}!"
      again?
    else
      board.display
      puts "Cat's Game!"
      again?
    end
  end

  def again?
    if over?
      puts "Do you want to play again?"
      input = gets.strip
    end
    if input.downcase == "yes" || input.downcase == "y"
      GameOptions.new
    elsif input.downcase == "no" || input.downcase == "n" || input.downcase == "exit"
      exit!
    else
      puts "Invalid input"
      again?
    end
  end



end
