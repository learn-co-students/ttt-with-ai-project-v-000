require 'spec_helper'

describe 'Players::Computer' do
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end

  describe '#guess' do
    it 'returns a first position for the computer to move' do
      computer = Players::Computer.new("X")
      board = Board.new

      computer_move = computer.guess(board)

      expect(0..8).to cover(computer_move)
    end

    it.skip 'takes an obvious finishing move' do
      computer = Players::Computer.new("X")
      board = Board.new
      board.update("1", computer)
      board.update("2", computer)

      computer_move = computer.guess(board)

      expect(computer_move).to eq(2)

    end
  end

end
