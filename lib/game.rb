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

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=(Board.new))
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if board.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        return combo
      end
    end
  end

  def draw?
      !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

  def winner
   if combo = won?
     @board.cells[combo[0]]
   end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(input)
      board.position(user_input)
      turn
    else
      display
    end
  end
end
