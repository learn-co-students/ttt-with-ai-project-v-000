
class Human < Player

  def move(board)
    #make a move, Human!
    puts "Where would you like to move?  Your token is #{self.token}"
    desired_move = gets.chomp
  end

end
