require_relative '../player.rb'
require 'pry'
module Players
class Computer < Player
  def move(board)
    move = nil
    board.cells.each.with_index {|cell, index| 
    if !board.taken?(index) 
    move = "#{index}" 
    end 
      
    }
    move
  end
end
end