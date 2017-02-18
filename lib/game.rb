class Game

  attr_accessor :player_one, :player_two
  attr_reader :board

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
    board.turn_count % 2 == 0 ? "X" : "O"
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect { |win|
      board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && (board[win[0] == "X"] || board[win[0] == "O"]) }
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? == nil ? nil : board[win[0]]
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    if board.valid_move?(@input)
      board.update(@input, current_player)
      board.display
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

  def start
    puts "Welcome to tic tac toe!"
    puts "Would you like a 0, 1, or 2 player game?"
    @player_count = gets.strip
    
  end
end
