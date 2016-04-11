class Player::Computer < Player
  def move(board=nil)
    puts "Computer Player #{self.token} played:"
    board.display
    sleep(1)
    (rand 1..9).to_s
  end
end
