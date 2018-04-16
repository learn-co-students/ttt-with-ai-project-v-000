class Game
  attr_accessor :board, :player_1, :player_2, :cells
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Array.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @cells = Array.new(9, " ")
  end

  def turn_count
    cells.count{|char| char=="X" || char == "O"}
  end

  def current_player(board)
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?(board)
    won?(board) || full?(board) || draw?(board)
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
  board[combo[0]] == board[combo[1]] &&
  board[combo[1]] == board[combo[2]] && position_taken?(board, combo[2])
    end
  end

  def winner(board)
    if win_combo = won?(board)
      board[win_combo.first]
    end
  end

  def draw?(board)
    full?(board) && !won?(board)
  end

  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end
end
