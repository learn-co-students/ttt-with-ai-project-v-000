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
    count = 0
    @board.cells.each do | c |
      if c == 'X' || c == 'O'
        count += 1
      end
    end
    @player_1.turn_count = count # Could refactor turn_count as a class variable within Player for DRY.
    @player_2.turn_count = count
    count
  end

  def current_player
    if turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    @@WIN_COMBINATIONS.each do |wc|
      if wc.all?{|c| board.cells[c] == "X"} || wc.all?{|c| board.cells[c] == "O"}
        return wc
      end
    end
    return false
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
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    n = current_player.move(board)
    if board.valid_move?(n)
      board.update(n, current_player)
    else
      puts "The board runs left to right, top to bottom. Please choose a free space, 1 - 9."
      turn
    end
    puts ""
    @board.display
    puts ""
  end

  def play
    until over?
      puts "Player #{current_player.token}'s turn:"
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome to TicTacToe!"
    puts "Choose 0, 1 or 2 players — or watch a 'wargame'." # "Players" here is meant in the colloquial sense of human players.
    style = gets.strip.downcase
    while !["0", "1", "2", "wargame"].include? style
      puts "Please enter 0, 1, 2 or wargame."
      style = gets.strip.downcase
    end

    if style == "wargame"
      wargame
    else
      if style.to_i == 0
        board = Board.new
        game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), board)

      elsif style.to_i == 1
        puts "OK! X goes first. Do you want to play X? y/n"
        player_first = gets.strip.downcase
        while !["y", "n"].include? player_first
          puts "Please enter y or n."
          player_first = gets.strip.downcase
        end
        if player_first == "y"
          board = Board.new
          game = Game.new(Players::Human.new('X'), Players::Computer.new('O'), board)
        else
          board = Board.new
          game = Game.new(Players::Computer.new('X'), Players::Human.new('O'), board)
        end

      else
        board = Board.new
        game = Game.new(Players::Human.new('X'), Players::Human.new('O'), board)
      end

      puts ""
      puts "Got it! Let's play."
      puts ""
      board.display
      puts ""
      game.play
    end
  end

  def wargame
    wins = 0
    n = 0
    final_cell_arrangements = []
    while n < 100
      board = Board.new
      game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), board)
      game.play
      final_cell_arrangements << board.cells
      if game.won?
        wins += 1
        binding.pry
      end
      n += 1
    end
    puts "There were #{wins} wins in the #{n} battles between the computers." # Currently running at 0% wins, yet to confirm that that is due to perfect defense (as opposed to bad offense).
    puts "There were #{final_cell_arrangements.uniq.size} unique final boards."
  end
end
