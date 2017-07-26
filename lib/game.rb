class Game
  include Players::Human
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Back diagonal
    [2,4,6]  # Front diagonal
  ]

  def initialize(player_1 = Players::Human, player_2 = Players::Human, board = [])
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    player_1.token = "X"
    player_2.token = "O"
  end

  def current_player

  end

  def play
    input = gets.strip
    if !over?(board)
      turn(board)
    elsif draw?(board)
      puts "Cats Game!"
    elsif won?(board)
      puts "Congratulations #{winner(board)}!"
    end
  end


end
