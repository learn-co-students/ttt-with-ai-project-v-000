require_relative "../player.rb"

class Human < Player

  def move(board)
    puts "Please choose a move by choosing a number."
    input = gets.strip
  end

end