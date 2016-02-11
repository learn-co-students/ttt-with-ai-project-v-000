require_relative "../player.rb"
class Human < Player

  def move(board)
    puts "Enter a move (1-9):"
    input = gets.strip
    input
  end

end