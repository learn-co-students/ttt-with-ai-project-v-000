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
    if (@board.turn_count.odd?)
      return @player_2
    else
      return @player_1
    end
  end

  def won?

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if (position_1 == position_2 && position_2 == position_3  && position_1 != " " && position_2 != " " && position_3 != " ")
        return win_combination
      end
    end

    return false

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
    if (won? || draw? || @board.full?)
      return true
    else
      return false
    end
  end

  def winner
    if !(won?)
      return nil
    else
      win_combination = won?
      return @board.cells[win_combination[0]]
    end
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
