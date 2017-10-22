require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")#makes a new computer
      board = Board.new #makes a new board

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board) #the computer class makes a move through the board = this is called the computer_move

      expect(valid_moves).to include(computer_move) #the test is expecting the valid moved array to be the computer's moves
    end
  end
end
