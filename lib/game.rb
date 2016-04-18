require "pry"

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #downward diagonal
    [6, 4, 2]  #upward diagonal
  ]

  def initialize(player_1 = Player::Human.new('X'), player_2 = Player::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    if board.full? == true
      true
    end
  end

  def won?
    WIN_COMBINATIONS.map do |win_comb|
      if board.cells[win_comb[0]] == "X" && board.cells[win_comb[1]] == "X" && board.cells[win_comb[2]] == "X"
        return win_comb
      elsif board.cells[win_comb[0]] == "O" && board.cells[win_comb[1]] == "O" && board.cells[win_comb[2]] == "O"
        return win_comb
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end 

  def winner
    if win_comb = won? 
      board.cells[win_comb.first] 
    end
  end

  def turn 
    player_turn = current_player.move(board) 
    if board.valid_move?(player_turn) 
      board.update(player_turn, current_player) 
    else
      turn
    end
  end

  def play
    until over? || draw? || won?
      board.display
      turn
    end
    if draw?
      puts "Cats Game!"  
    end    
    if won?
      puts "Congratulations #{winner}!"  
    end   
  end

end