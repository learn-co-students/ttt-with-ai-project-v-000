require_relative "../player.rb"

class Player::Human < Player

  def move(board)
    puts "Choose 1-9 for #{self.token.to_s}"
    gets.strip
  end

  def get_input
    input = gets.strip
  end

  def something
    turn
  end
end
