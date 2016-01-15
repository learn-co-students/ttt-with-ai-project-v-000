class Human < Player
  def initialize(token)
    @token = token
  end

  def move(board)   # ** For some reason test wants an argument variable here
    puts "Enter position where you whould like to place your move form 1 to 9."
    input = gets.chomp
    return input
  end
end