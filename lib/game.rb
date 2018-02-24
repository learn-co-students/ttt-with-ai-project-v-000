require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  
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
  
  def initialize(player_1 =Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do|combo|
      board.taken?(combo[0]+1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end
  
  def draw?
    !won? && board.full?
  end
  
  def winner
    winning_token = won?
    won? && board.cells[winning_token[0]]
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "That move is invalid!"
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  
  def select_players
    puts "Select number of players: 0, 1, or 2"
    input = gets.strip.to_i
    if input == 0
      @player_a = Players::Computer
      @player_b = Players::Computer
    elsif input == 1
      @a = Players::Human
      @b = Players::Computer
      select_token
    elsif input == 2
      @a = Players::Human
      @b = Players::Human
      select_token
    else
      select_players
    end
  end

def select_token
  puts "Which player should go first (X), 1 or 2?"
  input = gets.strip.to_i
  if input == 1
    @player_a = @a
    @player_b = @b
  elsif input == 2
    @player_a = @b
    @player_b = @a
  else
    select_token
  end
end
  
end