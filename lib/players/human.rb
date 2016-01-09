require_relative "../player.rb"
class Human < Player
  
  def move(board)
    puts "   #{@name}, What is your next move?"
    return gets.chomp
  end
    
end