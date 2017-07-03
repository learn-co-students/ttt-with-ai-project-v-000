module Players
class Human < Player
  def move(board)
    puts "Player #{self.token}, enter your move (1-9)"
    user_input = gets.strip
  end
 end
end
