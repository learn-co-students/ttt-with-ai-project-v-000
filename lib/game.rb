require 'pry'

class Game
attr_accessor :player_1, :player_2, :board

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do | el |
      if el.all? {|i| board.cells[i] == "O"} || el.all? {|i| board.cells[i] == "X"}
          # binding.pry
          winning_combo << el
          return winning_combo.flatten
        end
      end
    !winning_combo.empty? && over?
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "Player '#{current_player.token}' - Please select a square: "
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      puts "invalid"
      turn
    else
      @board.update(input, current_player)
      puts @board.display
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      self.play_again? # If these are commented out, all tests pass.
    elsif draw?
      puts "Cat's Game!"
      self.play_again? # If these are commented out, all tests pass.
    end
  end

  def play_again?
    puts "Play again? (Y/N)"
    input = gets.chomp.downcase
    if input == "y"
      start
    else
      puts "Thanks!"
      exit
    end
  end

  def start
  puts "What kind of game do you want? 0, 1, or 2 player."
  # Ask the user for who should go first and be "X".

    input = gets.chomp

    if input == "0"
      current_game = Game.new(Players::Computer.new("X"), Players::Computer.new("0"))
    elsif input == "1"
      puts "Who goes first as 'X'? (C)omputer or (H)uman?"
      human_or_comp = gets.chomp.downcase
      if human_or_comp == "h"
        current_game = Game.new(Players::Human.new("X"), Players::Computer.new("0"))
      elsif human_or_comp == "c"
        current_game = Game.new(Players::Computer.new("X"), Players::Human.new("0"))
      end
    elsif input == "2"
      current_game = Game.new
    elsif input.downcase == "exit"
      exit
    else
      puts "Please enter a valid game type."
    end

    current_game.board.display

    current_game.play
  end
end
