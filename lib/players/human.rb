require_relative "../player.rb"

class Human < Player
  def move(board=[])
    puts "Please choose a square(1-9)"
    choice = gets.strip
    choice
  end
end