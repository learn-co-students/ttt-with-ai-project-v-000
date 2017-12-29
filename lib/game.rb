class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0, 1, 2], #top rows
    [3, 4, 5], #middle rows
    [6, 7, 8], # bottom rows
    [0, 3, 6], #lvert
    [1, 4, 7], #mvert
    [2, 5, 8], #rvert
    [0, 4, 8], # diag1
    [2, 4, 6] # diag2
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def winner
      if combo = won?
        @winner = @board.cells[combo.first]
      end
    end

    def turn
      player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{@board.turn_count+1}\n"
        @board.display
        @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
        @board.display
      end
    end

    def play
      until over?
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end
  end
