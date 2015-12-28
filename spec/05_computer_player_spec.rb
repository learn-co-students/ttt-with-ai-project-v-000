require 'spec_helper'

describe 'Player::Computer' do
  it 'inherits from Player' do
    expect(Player::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Player::Computer.new("X")
      board = Board.new
      
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end

  describe '#won?' do
    it 'returns false for a draw' do
      computer = Player::Computer.new("X")
      board = Board.new

      expect(computer.won?(board)).to be_falsey
    end

    it 'returns true for a win' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(computer.won?(board)).to be_truthy
    end
  end

  describe '#draw?' do
    it 'returns true for a draw' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(computer.draw?(board)).to be_truthy
    end

    it 'returns false for a won game' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(computer.draw?(board)).to be_falsey
    end

    it 'returns false for an in-progress game' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]

      expect(computer.draw?(board)).to be_falsey
    end
  end

  describe '#over?' do
    it 'returns true for a draw' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(computer.over?(board)).to be_truthy
    end

    it 'returns true for a won game' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(computer.over?(board)).to be_truthy
    end

    it 'returns false for an in-progress game' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(computer.over?(board)).to be_falsey
    end
  end
end
