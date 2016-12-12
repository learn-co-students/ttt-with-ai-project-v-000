
class Human < Player

  def move(board)
    puts "Where would you like to move?  Your token is #{self.token}"
    desired_move = gets.chomp
  end

end
