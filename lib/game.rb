require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2, :position

=begin
    0 | 1 | 2
  -------------
    3 | 4 | 5
  -------------
    6 | 7 | 8
=end


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [2, 5, 8],
    [1, 4, 7],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end # initialize


  ## determines whose turn it is
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end # if_board.turn_count
  end # current_player


  ## Checks to see if the game is over
  def over?
    if won? || draw?
      true
    end # over?
  end # over?


  ## determines the the winning combination that matches
  def won?

    WIN_COMBINATIONS.detect do |combination|
      if combination.all? {|index| board.cells[index] == player_1.token}
        combination
      elsif combination.all? {|index| board.cells[index] == player_2.token}
        combination
      else
        false
      end # if combination.all?
    end # WIN_COMBINATIONS.any?
  end # won?


  ## determines if the game ended in a draw
  def draw?
    true if board.full? && !won?
  end # draw?


  ## determines the winner
  def winner
    if winning_combination = won?
      board.cells[winning_combination.first] ## returns the first player token of the winning combination
    end # if
  end # winner


  ## recursively calls this function until it receives a valid entry
  def turn
    puts "Player #{current_player.token}'s turn!'"
    puts "\n"
    user_input = current_player.move(board)

    if !board.valid_move?(user_input)
      puts "Invalid Move!"
      board.display
      turn
    else
      board.update(user_input, current_player)
      board.display
    end # if valid_move?

  end # turn

  ## plays a full game of tic-tac-toe until over
  ## announces winners at the end
  def play

    until over?
      turn
    end # until

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end # if
  end # play

end # class Game
