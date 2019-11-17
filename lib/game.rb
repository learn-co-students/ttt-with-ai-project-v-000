class Game
  extend Players
  attr_accessor :board, :player_1, :player_2
  # properties board, player_1 and player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right row
    [0,4,8],  # First diagonal
    [2,4,6]  # Second diagonal
  ]

  def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    status = false
    WIN_COMBINATIONS.each do |combination|
      if status == false && combination.all?{|y| @board.cells[y] == "X"} || combination.all?{|y| @board.cells[y] == "O"}
          @combination = combination
          status = true
      end
    end
    status
  end

  def winner
    won? == false ? nil : (@board.cells[@combination[1]] == "X" ? "X" : "O")
  end

  def draw?
    if won? == false && @board.full?
      # puts "Cat's Game!"
      true
    end
  end

  def over?
    draw? || won? != false ? true : false
  end

  def start

  end

  def play
    while !over?
      turn
    end
    draw? ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
  end

  def turn
    player = current_player
    player_move = player.move(board)
    # binding.pry
    @board.valid_move?(player_move.to_i) ? @board.update(player_move.to_i, player) : turn
    @board.display
  end

end
