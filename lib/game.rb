require 'pry'

class Game
attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn
    character = current_player
    input = character.move(@board)
    if @board.valid_move?(input) == true
      @board.update(input, character)
      @board.display
    else
      turn
    end
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    if !(won?)
      if (@board.full?)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    !won? || draw? ? nil : @board.cells[won?.first]
  end

  def play
    until over?
      turn
    end
    if (won?)
      if (winner == "X")
        # change to put the name of the player instaed of X
        puts "Congratulations X!"
        # create method and call it here to ask for a new game
      else
        puts "Congratulations O!"
      end
    elsif (draw?)
      puts "Cats Game!"
    end
  end

end
