class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
    
 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
  def current_player
    if Board.new.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if board.cells[win_combination[0]] == board.cells[win_combination[1]] &&
        board.cells[win_combination[1]] == board.cells[win_combination[2]] &&
        board.taken?(win_combination[0])
          TRUE
        win_combination
      end
    end
  end

  def draw?
    if board.full? && !won?
      TRUE
    else
      FALSE
    end
  end
  
  def over?
    if draw? || won? || board.full?
      TRUE
    else
      FALSE
    end
  end
  
  def winner
    if token = won?
      @winner = board.cells[token.first]
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    board.position(input)
    if board.valid_move?(index)
      update(index, current_player)
      display
    else 
      turn
    end
  end
  
  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{@winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
end