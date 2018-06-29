require_relative "../player.rb"
class Human < Player

  def move(board)
    puts "Enter a position 1-9"
    input = gets.strip
  end

end
