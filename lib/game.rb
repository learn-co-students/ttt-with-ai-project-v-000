class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.cells[combination[0]] == @board.cells[combination[1]] &&
        @board.cells[combination[1]] == @board.cells[combination[2]] &&
        @board.taken?(combination[0]+1)
        return combination
      end
    end
    return false
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      combination = won?
      @board.cells[combination[0]]
    end
  end

  def turn
    puts "Please enter a move: 1-9"
    @user_input = current_player.move(@board)
      if @board.valid_move?(@user_input)
        @board.update(@user_input, current_player)
      else puts "Please enter a number 1-9:"
        @board.display
        turn
      end
      @board.display
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

end
