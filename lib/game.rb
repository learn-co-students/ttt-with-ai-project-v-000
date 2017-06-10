class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left/Right diagonal
    [2, 4, 6] # Right/Left diagonal
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def play
    until over?
      turn
    end
    if over?
      if draw?
        puts "Cat's Game!"
      end
      if won?
        puts "Congratulations #{winner}!"
      end
=begin
      puts "Play again? (y/n)"
      again = gets.strip
      case again
      when "y"
        new_game = Start.new
      else
      end
=end
    end
  end

  def turn
    player = current_player
    puts "\nIt's #{player.token}'s turn.\n"
    #index = input_to_index(input)
    move = player.move(@board).to_i
    if board.valid_move?(move)
      board.update(move, player)
      puts "\n"
      puts "#{board.display}\n"
    else
      puts "Invalid move. Try again. \n"
      turn
    end
  end

  def turn_count
    counter = 0
    @board.cells.each do |pos|
        if pos == "X" || pos == "O"
          counter += 1
        end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      windex0 = combo[0]
      windex1 = combo[1]
      windex2 = combo[2]

      position_0 = @board.cells[windex0]
      position_1 = @board.cells[windex1]
      position_2 = @board.cells[windex2]

      if @board.taken?(windex0 + 1) && position_0 == position_1 && position_1 == position_2
        winning_combo = combo
      end
    end
    winning_combo
  end

  def full?
    !(@board.cells.include?(" ") || @board.cells.include?(""))
  end

  def draw?
    !won? && full?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

end
