class Human < Player
  attr_accessor :moves
    
  @moves = []

  def move (input)
    puts "Make your move HU-mon:"
    input = gets.chomp
     input
  end




end #of Human CLASS