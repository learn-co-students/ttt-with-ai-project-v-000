class Game

  attr_accessor :board
  attr_reader :player_one, :player_two

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

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def over?
    draw? || won?
  end

  def full?
    @board.all? {|x| x == "X" || x == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if board[win[0]] == "X" &&
         board[win[1]] == "X" &&
         board[win[2]] == "X"
         board
      elsif board[win[0]] == "O" &&
         board[win[1]] == "O" &&
         board[win[2]] == "O"
         board
      end
    end
  end

  def draw?
    full? && !won?
  end

  def winner
    @win = won?
    @win == nil ? nil : @board[@win[0]]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
