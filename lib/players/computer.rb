
require 'pry'
require_relative "../player.rb"

class Computer < Player

  def move(board)
    block = board.block?(@token)
    #binding.pry
    if block
      block+1
    else
      rand(1..9)
    end
  end

end