class Players::Computer < Player

attr_accessor :player

  def initialized(token)
    Player.new=self
    @token
  end

  def move(board)
    position = gets.strip
    if valid_move? (board, position)
      move(board, position, current_player)
    else
      turn(board)
    end
  end

end
  #  computer.move(board) == valid_move


  #    describe '#move' do
  #      it 'returns a valid position for the computer to move' do
  #        computer = Players::Computer.new("X")
  #        board = Board.new
#
#          valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#
#          computer_move = computer.move(board)
#
#          expect(valid_moves).to include(computer_move)
