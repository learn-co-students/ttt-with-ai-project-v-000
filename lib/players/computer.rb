class Computer < Player
  attr_reader :valid_moves

  def move(board)
    board.display
    @valid_moves = []
    board.cells.each_with_index do |value, index| 
      @valid_moves << ("#{index + 1}".to_s) if value == " "
    end
    sleep(1)
    @valid_moves.sample
  end

end
