class Human < Player
  attr_accessor :moves
    
  @moves = []

  def move (board = nil)
    puts "Make your move HU-mon:"
    player_move = gets.chomp
    while !(board.valid_move?(player_move)) && board != nil do
      puts "invalid"
      player_move = gets.chomp
    end
    player_move
  end
end #of Human CLASS