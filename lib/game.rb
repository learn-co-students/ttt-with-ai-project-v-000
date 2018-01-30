require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
       player_1
    else player_2
    end
  end

  def draw?
    if !won? && board.full?
       true
    else
       false
    end
  end

  def over?
    if won?
       true
    elsif draw?
       true
    elsif !board.full? && !won?
       false
    end
  end

  def won?
    killer = []
    WIN_COMBINATIONS.each do |set|
      if board.cells.count{|n| n == "X"} < 3 && board.cells.count{|n| n == "O"} < 3
        return false
      elsif (board.cells[set[0]] == "X" && board.cells[set[1]] == "X" && board.cells[set[2]] == "X")
        return set
      elsif (board.cells[set[0]] == "O" && board.cells[set[1]] == "O" && board.cells[set[2]] == "O")
        return set
      else killer << set
      end
    end
    return false if killer == WIN_COMBINATIONS
  end

  def winner
    if !won?
      return nil
    elsif won?
      return board.cells[won?[0]]
    end
  end

  def turn
    if current_player.class == Players::Human
    board.update(current_player.move(board), current_player)
    elsif current_player.class == Players::Computer
      board.update(current_player.move(board), current_player)
    end
    board.display
  end


  def play
    while !over? && !won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
