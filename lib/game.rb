require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :current_player

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

  def initialize( player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turns = @board.turn_count
    # binding.pry
    if turns % 2 == 0
      @current_player = @player_1
    else 
      @current_player = @player_2
    end
    return @current_player
  end

  def over?
    if draw? || @board.full? || won? 
      return true
    else 
      return false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board.cells[combo[0]]
      position_2 = @board.cells[combo[1]]
      position_3 = @board.cells[combo[2]]

      if(position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
        puts "Congratulations #{position_1}!"
        return combo
      end
    end
    return false
  end

  def draw?
    if !@board.full? || won?
      return false
    else
      puts "Cats Game!"
      return true
    end
  end

  def winner
    if self.won?
      return @board.cells[won?[0]]
    else
      return nil
    end
  end

  def turn
    @current_player = current_player
    input = current_player.move(@board.cells)
    if (board.valid_move?(input))
      @board.update(input,@current_player)
      # binding.pry
    else
      turn
    end
  end

  def play
    while !over?
      @board.display
      turn
    end
    if won?
      return @current_player
    end
  end
end

# game = Game.new
# game.turn 
# game.turn