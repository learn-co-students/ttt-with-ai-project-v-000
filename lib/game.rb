class Game
  attr_accessor :board, :player_1, :player_2, :input


  WIN_COMBINATIONS = [[0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #mid column
  [2, 5, 8], #right column
  [0, 4, 8], #diagonal down
  [6, 4, 2]] #diagonal up

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end


  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.any? do |combi|
      @board.cells[combi[0]] == "X" && @board.cells[combi[1]] == "X" && @board.cells[combi[2]] == "X" ||
      @board.cells[combi[0]] == "O" && @board.cells[combi[1]] == "O" && @board.cells[combi[2]] == "O"
    end
  end


  def draw?
    !won? && @board.full?
  end

  def winner
    winner = nil
    if won?
      WIN_COMBINATIONS.any? do |combi|
        if @board.cells[combi[0]] == "X" && @board.cells[combi[1]] == "X" && @board.cells[combi[2]] == "X"
          winner = "X"
        elsif @board.cells[combi[0]] == "O" && @board.cells[combi[1]] == "O" && @board.cells[combi[2]] == "O"
          winner = "O"
        end
      end
    end
    winner
  end
=begin - this is from the solution branch, 
wont work properly for ours since our other code is a little different, 
but something to take note of

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
=end
  def turn  # <= this isn't passing
    ans = self.current_player.move
    unless @board.valid_move?(ans)
      "invalid"
      ans = self.current_player.move
    else
      @board.update(ans, self.current_player)
      play
    end
  end

  def play
    unless over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
