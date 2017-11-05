class Game
  attr_accessor :board, :player_1, :player_2
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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def over?
    won? || draw?
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    # input = self.current_player.move(@board)
    # !self.board.valid_move?(input) ? turn : self.board.update(input, current_player)
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
  #  user_input = self.current_player.move(@board)
   #
  #  self.board.valid_move?(user_input) ? self.board.update(user_input, self.current_player) : turn
   # check if user_input is valid
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

# class Game
#   attr_accessor :board, :player_1, :player_2, :timer
#
#   WIN_COMBINATIONS = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8],
#   [0, 3, 6],
#   [1, 4, 7],
#   [2, 5, 8],
#   [0, 4, 8],
#   [6, 4, 2]
#   ]
#
#   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), wargame = false, board = Board.new)
#     @player_1 = player_1
#     @player_2 = player_2
#     @board = board
#     @wargame = wargame
#     @timer = 1.5
#   end
#
#   def current_player
#     board.turn_count.even?  ? player_1 : player_2
#   end
#   def won?
#     WIN_COMBINATIONS.find do |combo|
#       board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
#     end
#   end
#   def draw?
#     board.full? && !won?
#   end
#   def over?
#     won? || draw?
#   end
#   def winner
#     board.cells[won?[0]] if won?
#   end
#   def turn
#     puts "It's now #{current_player.token}'s turn."
#     input = current_player.move(board, timer).to_i #changed here
#     if board.valid_move?(input.to_s)
#       board.update(input, current_player)
#       system('clear')
#       puts "Game #{@counter}" if @wargame
#       board.display
#     elsif input.between?(1, 9) == false
#       puts "That is an invalid move"
#       turn
#     else
#       puts "Whoops! Looks like that position is taken"
#       turn
#     end
#   end
#   def play
#     board.reset!
#     system('clear')
#     puts "Game #{@counter}" if @wargame
#     board.display
#     while !over?
#       turn
#     end
#     if draw?
#       puts "Cat's Game!"
#     elsif won?
#       puts "Congratulations #{winner}!"
#     end
#   end
#   #def play
#   #     while !over?
#   #       turn
#   #     end
#   #     if won?
#   #       puts "Congratulations #{winner}!"
#   #     elsif draw?
#   #       puts "Cat's Game!"
#   #     end
#   #   end
#   def wargames
#     @counter = 0
#     x = 0
#     o = 0
#     draw = 0
#     until @counter == 100
#       @counter += 1
#       play
#       if draw?
#         draw += 1
#       elsif winner == "X"
#         x += 1
#       elsif winner == "O"
#         o += 1
#       end
#       sleep(@timer*1.5)
#       @timer -= (@timer/3)
#     end
#     puts "This round had #{x} wins for X, #{o} wins for O, and #{draw} draws."
#     puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
#     puts "HOW ABOUT A NICE GAME OF CHESS?"
#   end
# end
