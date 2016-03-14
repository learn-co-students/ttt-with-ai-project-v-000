require_relative "../player.rb"

class Human < Player

  def move(board)
    pos = gets.chomp
    pos
  end

end
