require 'pry'
class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  #def won?
    #WIN_COMBINATIONS.any? do |win|
      #if (board.cells[win[0]] == "X" || board.cells[win[0]] == "O") && board.cells[win[0]] == board.cells[win[1]] && board.cells[win[1]] == board.cells[win[2]]
        #true
      #else
        #false
      #end
    #end
  #end

#refactored to the following:
#this returns the winning array via #detect
#but if this returns the winning array, doesn't it not return true/false? it would either return the winning array or nil, so how is it passing the test?
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

#want to figure out how to make this work:
  #def won?
    #WIN_COMBINATIONS.detect do |combo|
      #combo.all? do |num|
        #if @board.cells[num] == "X"
        #true
        #elsif @board.cells[num] == "O"
        #true
        #else
        #false
      #end
      #end
    #end
  #end

  def winner
    @board.cells[won?.first] if won? != nil
  end

  def start

  end

  def play
    until over?
      puts "Hey playa playa! It's #{current_player.token}'s turn. Please enter 1-9:"
      turn
      board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
      end
  end

  def turn
    position = current_player.move
    if board.valid_move?(position)
      board.update(position, current_player)
    else
      puts "That spot does not exist or is taken."
      position = current_player.move
      board.update(position, current_player) if board.valid_move?(position)
    end
  end

end