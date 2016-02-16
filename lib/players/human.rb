class Human < Player
  attr_accessor :human_move, :board

  def move(board)
    puts "Where do you want to move, #{self.token}? 1-9:"
    @human_move = gets
    human_move
  end

end

