

class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def won?
    answer = []
    WIN_COMBINATIONS.each do |combo|
      result = []
      combo.each { |j| result << @board.cells[j] }
      answer << result
      break if result.all?{ |ele| ele == "X" } || result.all?{ |ele|  ele == "O"}
      end
      answer.last.all?{ |ele| ele == "X" } || answer.last.all?{ |ele|  ele == "O"}
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if won?
      winner_check
    else
      nil
    end
  end

  def winner_check
    answer = []
    WIN_COMBINATIONS.each do |combo|
      result = []
      combo.each { |j| result << @board.cells[j] }
      answer << result
      break if xwin?(result) || owin?(result)
      end
    answer.last[0]
  end

  def xwin?(array)
    array.all? { |d| d == "X"}
  end

  def owin?(array)
    array.all? { |d| d == "O"}
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input,current_player)
      @board.display
    else
      turn
    end

  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner_name}!"
      return 1
    else
       puts "Cat's Game"
       return 0
    end
  end

  def winner_name
    winner == "X" ? @player_1.name : player_2.name
  end

end
