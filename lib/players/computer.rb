class Computer < Player

  def move(board)
    @index = 0
    board.cells.find do |cell|
      cell == " "
      @index += 1
    end
    @index.to_s
    # binding.pry
  end

end
