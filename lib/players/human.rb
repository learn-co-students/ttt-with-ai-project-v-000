class Human < Player
  attr_accessor :moves
    
  @moves = []

  def move (board = nil)
    puts "Make your move HU-mon:"
    player_move = gets.chomp
    player_move
  end
end #of Human CLASS