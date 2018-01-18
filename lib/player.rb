class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def move(board)
    puts "Where do you want to move? Please choose a number 1-9."
    input = gets.strip
  end

  def occupied_spots(board)
    board.cells.each_index.select {|i| board.cells[i] == self.token}
  end

  def opponent_token(board)
    if token == "X"
      "O"
    else
      "X"
    end
  end

  def occupied_by_opponent(board)
    board.cells.each_index.select {|i| board.cells[i] == opponent_token(board)}
  end
end
