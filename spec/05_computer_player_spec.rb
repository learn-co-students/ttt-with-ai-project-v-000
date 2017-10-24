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

  describe '#win_or_block' do
    it 'returns string of 3' do
      board = Board.new
      board.cells[0] = "O"
      board.cells[1] = "O"
      computer = Players::Computer.new("X")
      expect(computer.win_or_block(board, "O")).to eq("3")
    end

    it 'returns string of 9' do
      board = Board.new
      board.cells[0] = "O"
      board.cells[4] = "O"
      computer = Players::Computer.new("X")
      expect(computer.win_or_block(board, "O")).to eq("9")
    end
  end

  describe '#find_win_or_block' do
    it 'finds a potential winning combo' do
      board = Board.new
      board.cells[0] = "O"
      board.cells[4] = "O"
      computer = Players::Computer.new("X")
      expect(computer.find_win_or_block(board, "O")).to eq([0, 4, 8])
    end

    it 'returns nil for a combo with three filled positions' do
      board = Board.new
      board.cells[0] = "O"
      board.cells[1] = "O"
      board.cells[2] = "X"
      computer = Players::Computer.new("X")
      expect(computer.find_win_or_block(board, "O")).to eq(nil)
    end
  end
end
