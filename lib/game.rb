class Game

  attr_reader :board, :player_one, :player_two

  WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

  def initialize(p1=Human.new("X"), p2=Human.new("O"), bd=Board.new)
    @player_one = p1
    @player_two = p2
    @board = bd
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect { |win|
      board[win[0]] == board[win[1]] == board[win[2]] && (board[win[0] == "X"] || board[win[0] == "O"]) }
  end

  def draw?
    full? && !won?
  end

  def winner
    @win = won?
    @win == nil ? nil : @board[@win[0]]
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index(@input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  def play
    until over? do
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
