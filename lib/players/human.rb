require_relative "../player.rb"
module Players

class Human < Player

  def move(board)
    puts "Please make a move"
    user_input = gets.strip
    user_input
  end

end
end
