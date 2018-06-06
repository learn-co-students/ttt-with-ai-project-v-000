require 'pry'
class Game
  include Players
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  @@draw_count = 0

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      @board.position(combination[0]+1) == @board.position(combination[1]+1) and
      @board.position(combination[0]+1) == @board.position(combination[2]+1) and
      @board.position(combination[0]+1) != " "
    end
  end

  def draw?
    true if @board.full? == true and won? == nil
  end

  def over?
    if draw? == true or won? != nil
      if draw? == true
        @@draw_count+=1
      end
      true
    else
      false
    end
  end

  def winner
    if won? != nil
      @board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
    end
  end

  def play
    if !over?
      turn
    end
    while !over?
      turn
    end

    puts "Congratulations #{winner}!" if won? != nil
    puts "Cat's Game!" if draw? == true
  end

  def self.draw_count
    @@draw_count
  end

end
