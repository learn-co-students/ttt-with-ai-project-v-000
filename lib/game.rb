class Game
  attr_accessor :board, :player_1, :player_2, :team
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     @board.turn_count % 2 == 0 ? @player_1 : @player_2
   end

   def over?
    won? || draw?
  end

  def draw?
    @board.full? && !won?
  end
  # def draw?
  #   !won? && full?
  # end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end
  # def won?
  #   WIN_COMBINATIONS.detect do |combo|
  #     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] &&
  #     @board[combo[1]] == @board[combo[2]]
  #     return combo
  #   end
  # end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  # def winner
  #   if winning_combo = won?
  #     @board[winning_combo.first]
  #   end
  # end

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
  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   index = input_to_index(input)
  #   if valid_move?(index)
  #     move(index, current_player)
  #     display_board
  #   else
  #     turn
  #   end
  # end

end

# def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @board = board
#     @player_1 = player_1
#     @player_2 = player_2
#   end
