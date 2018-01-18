require 'pry'
class Game 

  #<Players::Human

  attr_accessor :player_1, :player_2, :board

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

  def initialize(p1=Players::Human.new("X"), p2=Players::Human.new("O"), bd=Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = bd
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if board.cells[win[0]] == "X" &&
         board.cells[win[1]] == "X" &&
         board.cells[win[2]] == "X"
         board
      elsif board.cells[win[0]] == "O" &&
         board.cells[win[1]] == "O" &&
         board.cells[win[2]] == "O"
         board
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    win = won?
    win == nil ? nil : board.cells[win[0]]
  end

  def turn
    @input = current_player.move(board)
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
    puts "Would you like a 0, 1, or 2 player game?"
    @player_count = gets.strip.to_i
    if @player_count == 0
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      puts "The computers will begin playing now"
    elsif @player_count == 1
      puts "Would you like to go first or second? Please enter 1 or 2"
      @order = gets.strip.to_i
      if @order == 1
        @player_2 = Players::Computer.new("O")
        puts "Player 1 is human and will take the first turn"
      elsif @order == 2
        @player_1 = Players::Computer.new("X")
        puts "The computer is player 1 and will take the first turn"
      end
    elsif @player_count == 2
      puts "Player 1 will begin"
    end

    play
    
  end

end