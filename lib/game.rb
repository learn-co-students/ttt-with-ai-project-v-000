
class Game
  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 =  player_2
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row win
    [3, 4, 5], #Middle row win
    [6, 7, 8], #Bottom row win
    [0, 3, 6], #left column win
    [1, 4, 7], #middle column win
    [2, 5, 8], #right column win
    [0, 4, 8], #left diagonal win
    [2, 4, 6] #right diagonal win
  ]

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    won? || draw? ? true : false
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|

      if @board.cells.values_at(combo[0], combo[1], combo[2]) == ["X", "X", "X"]
        true
      elsif @board.cells.values_at(combo[0], combo[1], combo[2]) == ["O", "O", "O"]
        true
      else
        false
      end

    end #any?
  end #won

  def draw?
    board.full? && !won? ? true : false
  end #darw?

  def winner
    if won?
      result = ""
      WIN_COMBINATIONS.detect do |combo|
        if @board.cells.values_at(combo[0], combo[1], combo[2]) == ["X", "X", "X"]
          result << @board.cells[combo[0]]
        elsif @board.cells.values_at(combo[0], combo[1], combo[2]) == ["O", "O", "O"]
          result << @board.cells[combo[0]]
        end
      end #detect
      result
      end #if
   end #winner

  def turn
    player = current_player
    input = player.move(board)
    if !board.valid_move?(input)
      puts "Invalid Move, please enter a number between 1 to 9:"
      @board.display
      turn
    else
      board.update(input, player)
      @board.display
    end
  end

  def play
    puts "Welcome to Tic-Tac_Toe"
    until over?
      turn
    end #until

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end #if

  end #play

end # Class Game
