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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def play
    until over? || @board.turn_count == 10
      turn
    end
    puts "#{@board.display}\n" if won? || draw?
    puts green("Congratulations #{winner}!") if won?
    puts brown("Cat's Game!") if draw?
  end

  def turn
    move = ''
    until @board.valid_move?(move)
      if current_player.token == "X"
        puts red("\n#{current_player.token}, please enter 1-9:\n")
      else
        puts green("\n#{current_player.token}, please enter 1-9:\n")
      end
      move = current_player.move(@board)
    end
    @board.update(move, current_player)
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combo|
      if @board.cells[winning_combo[0]] == @board.cells[winning_combo[1]] &&
         @board.cells[winning_combo[1]] == @board.cells[winning_combo[2]] &&
         @board.taken?(winning_combo[0]+1)
         return winning_combo
      end
    end
    false
  end

  def winner
    won? ? @board.cells[won?[0]].to_s : nil
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw? || @board.full?
  end

# coloration

  def red(text) "\e[31m#{text}\e[0m" end
  def green(text) "\e[32m#{text}\e[0m" end
  def brown(text) "\e[33m#{text}\e[0m" end

end
