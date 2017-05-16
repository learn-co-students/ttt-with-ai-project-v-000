require_relative './players/human.rb'

class Game
  include Players
  attr_accessor :board, :player_1, :player_2

  @@wargames = {"X wins" => 0, "O wins" => 0, "Draws" => 0}

  def self.wargames
    @@wargames
  end

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board.display
   end

  def current_player
    if @board.turn_count.odd?
      player_2
    else player_1
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else puts "#{input} isn't a valid move, try again."
      turn
    end
  end

#it's not enough to check for the win combinations, those cells have to contain something!!!
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
    board.cells[won?[0]]
  end
end

  def play
    turn until over?
    if draw?
      self.class.wargames["Draws"] += 1
      puts "Cat's Game!"
    elsif won?
      if winner == "X"
      self.class.wargames["X wins"] += 1
    elsif winner == "O"
      self.class.wargames["O wins"] += 1
    end
      puts "Congratulations #{winner}!"
    end
  end

end
