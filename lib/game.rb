require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  @@WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]]

  WIN_COMBINATIONS = @@WIN_COMBINATIONS # This is needed to pass a test but violates DRY. Check solution for more compact and elegant approach.

  def self.win_combinations
    @@WIN_COMBINATIONS
  end

  def initialize(player_1=Players::Human.new('X'), player_2=Players::Human.new('O'), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    count = @board.cells.count{|c| c == "X" || c == "O"}
    @player_1.turn_count = count # Could refactor turn_count as a class variable within Player for DRY.
    @player_2.turn_count = count
    count
  end

  def current_player
    turn_count.even? ? @player_1: @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def full?
    !board.cells.any? {|c| c == " " || c == ""}
  end

  def draw?
    return full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    next_move = current_player.move(board)
    if board.valid_move?(next_move)
      board.update(next_move, current_player)
    else
      puts "The board runs left to right, top to bottom. Please choose a free space, 1 - 9."
      turn
    end
    puts ""
    @board.display
    puts ""
  end

  def self.wargame
    wins = 0
    basicAI_wins = 0
    advancedAI_wins = 0
    n = 0
    final_cell_arrangements = []
    while n < 100
      board = Board.new
      game = Game.new(Players::Computer::BasicAI.new('X'), Players::Computer::AdvancedAI.new('O'), board)
      CLItictactoe.new.play(game)
      final_cell_arrangements << board.cells
      if game.won?
        wins += 1
        if game.winner == "X"
          basicAI_wins += 1
          # binding.pry
        else
          advancedAI_wins += 1
        end
      end
      n += 1
    end
    puts "There were #{wins} wins in the #{n} battles between the computers." # Currently running at 0% wins, yet to confirm that that is due to perfect defense (as opposed to bad offense).
    puts "BasicAI, playing first as X, won #{basicAI_wins} times. AdvancedAI, playing second as O, won #{advancedAI_wins}."
    puts "There were #{final_cell_arrangements.uniq.size} unique final boards."
  end
end
