require "pry"

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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.cells.count {|space| space != " "} % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? == true || draw? == true ? true : false
  end

  def won?
    answer = false
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] != " " && 
      @board.cells[array[0]] == @board.cells[array[1]] && 
      @board.cells[array[0]] == @board.cells[array[2]] ? 
      answer = true : answer = false
    end
    answer
  end

  def draw?
    won? == false && board.full? == true ? true : false
  end

  def winner
    if won? == true
      if @board.cells.count {|space| space == "X"} > @board.cells.count {|space| space == "O"}
        "X"
      else
        "O"
      end 
    else
      nil
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input) == false
      #binding.pry
      "invalid"
      turn
    else
      @board.update(input, current_player)
      input
    end
  end

  def play
    if over? == false
      turn
      play
    elsif won? == true
      puts "Congratulations #{winner}!"
    elsif draw? ==true 
      puts "Cats Game!"
    end
  end


end