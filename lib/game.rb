require_relative 'players/human.rb'
require 'pry'
class Game

include Players

attr_accessor :board, :player_1, :player_2

def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"), board=Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def self.board
  @board = []
end

def current_player
  count = 0
  @board.cells.collect do |move|
    if move == "X" || move == "O"
      count +=1
    end
  end

    if count == 0
      return self.player_1
    elsif count % 2 == 0
      return self.player_1
    else
      return self.player_2
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
          return "X"
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"
        end
      end
    return false
end

def full?
  if @board.cells.any? {|x| x == " "}
    return false
  else
    return true
  end
end

def draw?
  if full? == true && won? == false
    return true
  else
    return false
  end
end

def over?
  return true if draw? || won?
end

def winner
  if won? == "X"
    return won?
  elsif won? == "O"
    return won?
  else
    return nil
  end
end

def turn
    go = current_player.move(@board)

    if @board.valid_move?(go)

       if current_player.class == Players::Human
         @board.update(go,current_player)
         @board.display
       elsif current_player.class == Players::Computer
         @board.update(go,current_player)
         @board.display_computer
       end
    else
      puts "Sorry, that's an invalid move. Please try another one."
      turn
    end
end

def play
  board.display_intro
  turn until over?
  puts "Congratulations #{winner}!" if won?
  puts "Cats Game!" if draw?
end


end
