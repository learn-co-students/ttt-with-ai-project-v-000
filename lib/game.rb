class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # Top row (across)
  [3,4,5],  # Middle row (across)
  [6,7,8], # Bottom row (across)
  [0,3,6], # Left column (vertical)
  [1,4,7], # Center column (vertical)
  [2,5,8], # Right column (vertical)
  [0,4,8], # Top-Left to Bottom-Right (diagonal)
  [6,4,2]  # Bottom-Left to Top-Right (diagonal)
]
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def find_win_combination
    WIN_COMBINATIONS.find do |win_combo|
      board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
      board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
      board.taken?(win_combo[0] + 1)
    end
  end

  def won?
    !!find_win_combination
  end

  def winner
    @winner = board.cells[(find_win_combination.first)] if won?
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def turn
    board.display
    current_move = current_player.move(board)

    if board.valid_move?(current_move)
      board.update(current_move, current_player)
    else # if not a valid move
      if current_move.to_i.between?(1,9)
        puts "\nSorry but position '#{current_move}' is already taken. Please choose again.\n"
      else
        puts "\nSorry but '#{current_move}' is not a valid entry. Please try again.\n"
      end
      turn
    end
  end

  def play
    while !over?
      puts "\n\tThis is move ##{board.turn_count.to_i + 1} of the game.\t",
           "\tLet's GO!\n\t"
      turn
    end

    if won?
      puts "\nGame Over!"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "\nOh. Great."
      puts "Cats Game!"
    end

    puts board.display
    puts ""
  end

end
