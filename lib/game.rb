require 'pry'
class Game
  attr_accessor :cells, :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [2,4,6],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)

    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player


    if board.turn_count%2 == 0
      player_1
    else
      player_2

    end


  end

  def over?
    won? || draw?
  end

  def won?
      WIN_COMBINATIONS.detect do |x|

        @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[1]] == @board.cells[x[2]]&&
        @board.taken?(x[0]+1)

        end

  end

  def draw?
    @board.full? && !won?

  end

  def winner
    if won?
      @winner = @board.cells[won?.first]
    end
  end

  def turn
    player = current_player

    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"

      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"

    elsif draw?
      puts "Cats Game!"
    end

  end




end
