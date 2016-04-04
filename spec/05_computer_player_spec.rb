require 'spec_helper'

describe 'Player::Computer' do
  it 'inherits from Player' do
    expect(Player::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Player::Computer.new("X")
      board = Board.new(["O", "O", " ", "X", " ", " ", "X", " ", " "])
      
      valid_moves = "3"

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end
end
