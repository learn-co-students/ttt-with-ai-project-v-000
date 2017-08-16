require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6]  # Right diagonal
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.odd?
        player_2
    else
        player_1
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
        board.cells[win_array[0]] != " " && board.cells[win_array[0]] == board.cells[win_array[1]] && board.cells[win_array[1]] == board.cells[win_array[2]]
    end
  end
  
  def draw?
    board.full? && !won?
  end

  def winner
    if win_array = won?
        board.cells[win_array[0]]
    else
        nil
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !board.valid_move?(current_move)
        turn
    else
        puts "Turn: #{board.turn_count + 1}"
        board.update(current_move, player)
        puts "#{player.token} chose #{current_move}"
    end
  end

  def play
    until over?
        turn
    end
    if won?
        board.display
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
  end

end