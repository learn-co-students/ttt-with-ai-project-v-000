class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 =Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 =player_1
    @player_2= player_2
    @board= board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
      @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
      @board.taken?(win_combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
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
      puts "\n\n"
    end
  end

  def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        @board.taken?(combo[0]+1)
      end
    end

    def draw?
      @board.full? && !won?
    end

end
