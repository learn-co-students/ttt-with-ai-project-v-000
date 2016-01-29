class Computer < Player
  attr_reader :valid_moves

  def move(board)
    @valid_moves = []
    board.cells.each_with_index do |value, index| 
      @valid_moves << ("#{index + 1}".to_s) if value == " "
    end
    @valid_moves.sample
  end

end
