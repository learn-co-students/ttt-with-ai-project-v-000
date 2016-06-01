class Computer < Player


  def move(board)
    self.strategy.move
    # @index = 0
    # board.cells.find do |cell|
    #   cell == " "
    #   @index += 1
    # end
    # @index.to_s
    # binding.pry
  end

  def turn_1_player_2
    board.valid_move?(5) ? 5 : 1
  end



end
