class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    if player_1.instance_of?(Players::Computer)
      player_1.board = @board
      player_1.game = self
    end
    if player_2.instance_of?(Players::Computer)
      player_2.board = @board
      player_2.game = self
    end
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # def over?
  #   if board.full?
  # end
  def won?

    WIN_COMBINATIONS.each do |win_combination|
      #cycles through WIN_COMBINATIONS i.e. [0,1,2], then [3,4,5], then [6,7,8]
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      #then gets values at each of these cells
      position_1 = board.cells[win_index_1] #could be "X", "O", or " "
      position_2 = board.cells[win_index_2] #could be "X", "O", or " "
      position_3 = board.cells[win_index_3] #could be "X", "O", or " "

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
    false
  end

# more elegant solution
  # def won?
  #   winning_array = Game::WIN_COMBINATIONS::WIN_COMBINATIONS
  #   winning_array.detect do |combo|
  #     board.cells[combo[0]] == board.cells[combo[1]] &&
  #     board.cells[combo[1]] == board.cells[combo[2]] &&
  #     board.taken?(combo[0] + 1)
  #   end
  # end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    player_input = current_player.move(board) #where board is a pointless argument
    binding.pry
    #move just asks for a player input from a specific player
    if board.valid_move?(player_input)
      board.update(player_input, current_player)
      board.display

    else
      turn
    end
  end

  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   spot = input_to_index(input)
  #   x_or_o = current_player
  #   if (valid_move?(spot))
  #     move(spot,x_or_o)
  #     display_board
  #   else
  #     turn
  #   end
  # end

  def play
    turn until over?
    player_2.score
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def start # a blank test spec for this...
  end

end
