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

  #describe '#corners' do
  #  it 'returns an array with the values of each of the four corners on the current board'
  #    computer = Players::Computer.new("X")
  #    board = Board.new
  #    board.cells = ["X", " ", " ", " "]

  #    expect(corners(board)).to match_array(["X", " ", " ", " "])
  #end
end
