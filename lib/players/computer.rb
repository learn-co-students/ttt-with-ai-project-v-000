class Computer < Player
  include SharingIsCaring
  def move(board = nil)
    move = rand(1..9).to_s
  end
end