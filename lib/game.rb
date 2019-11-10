class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def player_1
   @player_1
  end

  def player_2
   @player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
  ]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board.cells[win_combination[0]] == @board.cells[win_combination[1]] &&
    @board.cells[win_combination[1]] == @board.cells[win_combination[2]] &&
    @board.taken?(win_combination[0]+1)
    end
   end

   def full?
    cells.none? {|cell| cell == " " || cell == nil}
   end

   def draw?
    !won? && @board.full?
   end

    def winner
     if won?
      return @board.cells[won?[0]]
     end
    end

   def over?
     @board.full? || won?
   end

    def valid_move(input)
      input = input.to_i
      input.between(1,9) && !taken?(input)
    end

    def turn
     user_input = current_player.move(@board)
     puts "Please enter 1-9:"

     if @board.valid_move?(user_input)
       @board.update(user_input, current_player)
     else puts "Please enter a valid move from 1-9:"
      @board.display
      turn
     end
     display
     end

  def play
    while !over? && !won? && !draw?
     turn
    end
    if won?
     puts "Congratulations #{winner}!"
    else draw?
     puts "Cat's Game!"
    end
  end

end
