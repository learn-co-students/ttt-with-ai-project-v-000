class Player::Computer < Player

  attr_accessor :valid_moves, :board

  def move(board)
    puts "Computer #{self.token}'s turn!\n\n"
    @valid_moves = []
    @board = board
    board.cells.each_with_index do |cell, index|
      @valid_moves << index.to_s if board.valid_move?(index.to_s)
    end
    @valid_moves[0]
    #ai_move
  end

  def ai_move

  end

  def two_in_a_row
    
  end


end
