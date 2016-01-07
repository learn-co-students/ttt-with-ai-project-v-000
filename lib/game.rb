require_relative 'players/computer.rb'
require_relative 'players/human.rb'

class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]
  def initialize(p1=Player::Human.new("X"), p2=Player::Human.new("O"), board=Board.new)
    @player_1=p1
    @player_2=p2
    @board=board
  end

  def current_player
    (@board.turn_count % 2 == 0) ? @player_1 : @player_2
  end

  def over?
    (draw? || won?)
  end

  def won?
    win_combinations = WIN_COMBINATIONS
    cells=@board.cells
    winner = win_combinations.detect do |combos|
      cells[combos[0]]==cells[combos[1]] && cells[combos[1]]==cells[combos[2]] && cells[combos[1]]!=" "
    end
    winner
  end

  def draw?
    (@board.full? && !won?)
  end

  def winner
    return nil unless won?
    board.cells[won?[0]]
  end

  def turn
    while true
      if current_player.type==(:human)
        move = current_player.move
      elsif current_player.type==(:cpu)
        move = current_player.move(@board)
      end
      if @board.valid_move?(move)
        @board.update(move, current_player)
        break
      end
      puts "Invalid move, please try again."
      if current_player.type==(:cpu)
        puts "AI can no longer handle it's own strength, the cake was a lie"
        raise 'An error has occured.'
        break
      end
    end
  end

  def play
    @board.display
    until over? do
      turn
      @board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

