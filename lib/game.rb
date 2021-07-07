require 'pry'
#require 'spec_helper'

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

=begin
  def self.start

    puts "Welcome to Tic-Tac-Toe!!"
    puts "What kind of game would you like to play (0, 1, or 2)?"
    type_of_game = gets.chomp.to_i
    if type_of_game != 0
      puts "Who would like to go first and be 'X', Human or Computer?"
      first_player = gets
    end

    board = Board.new

    if type_of_game == 0
      game = self.new(Players::Computer.new('X'), Players::Computer.new('O'), board)
    elsif type_of_game == 1 && first_player == "Computer"
      game = self.new(Players::Computer.new('X'), Players::Human.new('O'), board)
    elsif  type_of_game == 1 && first_player == "Human"
      game = self.new(Players::Human.new('X'), Players::Computer.new('O'), board)
    else type_of_game == 2
      game = self.new(Players::Human.new('X'), Players::Human.new('O'), board)
    end
    game

  end
=end

  def current_player
    turns = @board.turn_count
    #binding.pry
    if turns == 0
      @player_1
    elsif turns % 2 == 1 && turns != 0
      @player_2
    else
      @player_1
    end
  end

  def won?

    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]


        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        end
      end
      return false
    end

  def draw?
    if @board.full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if self.draw? == true
      return true
    elsif self.won? != false
      return true
    elsif @board.full? == true
      return true
    elsif self.won? == true && @board.full? == false
      return true
    else
      return false
    end
  end

  def winner
    if self.won? == false
      return nil
    else
      winning_array = self.won?
      index = winning_array[0]
      if @board.cells[winning_array[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def turn

    input = current_player.move(@board)
    if @board.valid_move?(input) == false
      input = current_player.move(@board)
    end
    @board.update(input, current_player)

  end


  def play

    until over? == true
      if @board.turn_count != 0
        @board.display
      end
      turn
    end

    if draw? == true
      @board.display
      puts "Cat's Game!"
    elsif winner == "X"
      @board.display
      puts "Congratulations X!"
    elsif winner == "O"
      @board.display
      puts "Congratulations O!"
    else
      @board.display
      puts "Thanks for playing"
    end
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

end
