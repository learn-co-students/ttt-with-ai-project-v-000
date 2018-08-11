require 'pry'
module Players

class Human < Player

  def move(board)
    puts "Please enter 1-9:"
    #binding.pry
    input = gets.strip
    index = input.to_i - 1
    if board.cells[index].nil? || board.cells[index] == " "
      input
    else
      puts "Whoops! That space is taken."
      move(board)
    end
  end

end

end
