class Human < Player
  attr_accessor :moves
    
  @moves = []

  def move (board)
    puts "Make your move HU-mon:"
    player_move = gets.chomp
    until board.valid_move?(player_move) do
      puts "invalid"
      move = current_player.move(board = "")
    end
    input
  end




end #of Human CLASS