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
  [6,4,2]
]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|location| @board.cells[location] == "X"} || 
        win_combination.all? {|location| @board.cells[location] == "O"}
        true
      end
    end
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def winner 
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|location| @board.cells[location] == "X" }
        return "X"
      elsif win_combination.all? {|location| @board.cells[location] == "O" }
        return "O"
      end
    end
  end


  def turn
    this_move = current_player.move(board)
    if @board.valid_move?(this_move)
      puts "\n\n\n"
      puts "Turn count is: #{@board.turn_count + 1}"
      @board.update(this_move, current_player)
      @board.display
    else
      turn
    end

  end

  def play
    @board.display
    until over?
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