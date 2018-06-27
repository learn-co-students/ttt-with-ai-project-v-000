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
    #@board.cells.count {|space| space != " "} % 2 == 0 ? @player_1 : @player_2
    player_1_spaces = @board.cells.count {|space| space == @player_1.token}
    player_2_spaces = @board.cells.count {|space| space == @player_2.token}
    if player_1_spaces > player_2_spaces
      @player_2
    elsif player_2_spaces > player_1_spaces
      @player_1
    elsif player_1_spaces == player_2_spaces
      @player_1 #if player one always goes first
    end
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
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move) == false
      #binding.pry
      "invalid"
      puts "invalid move"
      puts "where would you like to go?"
      @board.display
      turn
    else
      puts "Turn # #{@board.turn_count+1}"
      @board.update(current_move, current_player)
      current_move
    end
  end

  def play
    if over? == false
      @board.display
      puts "where would you like to go?"
      turn
      play
    elsif won? == true
      @board.display
      puts "Congratulations #{winner}!"
    elsif draw? ==true
      @board.display 
      puts "Cats Game!"
    end
  end


end