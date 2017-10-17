require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = "X", player_2 = "O", board = "[" ", " ", " ", " ", " ", " ", " ", " ", " "]")
    if player_1.is_a?(Player)
      then @player_1 = player_1
    else
      @player_1 = Players::Human.new(player_1)
    end
    if player_2.is_a?(Player)
      then @player_2 = player_2
    else
      @player_2 = Players::Human.new(player_2)
    end
    if board.is_a?(Board)
      then @board = board
    else
      @board = Board.new
    end
  end

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

  def turn_count
    counter = 0
    @board.cells.each do |b|
      if b == 'X' || b == 'O'
        counter += 1
      end
    end
    return counter
  end

  def current_player
    count = turn_count
    count.even? == true ? @player_1 : @player_2
  end

  def won?
     WIN_COMBINATIONS.detect { |index_array|
     index_array.all? {|i| @board.cells[i] == "X"} || index_array.all? {|i| @board.cells[i] == "O"}}
  end

  def full?
    @board.cells.all? { |i| !(i == ' ' || i.nil?) }
  end

  def draw?
    !(won?) && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      if WIN_COMBINATIONS.any? { |index_array| index_array.all? {|i| @board.cells[i] == "X" }}
         return 'X'
       else return 'O'
     end
    end
  end

  def turn
    index = 0
    player = current_player
    index = player.move(@board).to_i
    if @board.valid_move?(index) &&  !@board.position_taken?(index.to_i - 1)
      @board.update(index, player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
     turn
    end
    if draw?
      puts 'Cat\'s Game!'
    else
      puts "Congratulations #{winner}!"
    end
  end

  def call
    @board.display
    play
  end

end
