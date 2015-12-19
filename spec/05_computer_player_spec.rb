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

  describe '#block' do
    it 'looks for a combo where the opposing player occupies two spaces and returns the third unoccupied space' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = [" ", " ", "O", " ", " ", " ", "O", " ", " "]

      expect(computer.block(board)).to eq(4)
    end
  end

  describe '#winnable' do
    it 'looks for a combo where the player occupies two spaces and returns the third unoccupied space' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = [" ", " ", " ", " ", " ", " ", "X", " ", "X"]

      expect(computer.winnable(board)).to eq(7)
    end
  end

  describe '#highest_score' do
    it 'looks for the cell with the highest score value' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

      expect(computer.highest_score(board)).to eq(4)
    end
  end

  describe '#cell_not_taken' do
    it 'looks for an unoccupied space' do
      computer = Player::Computer.new("X")
      board = Board.new
      board.cells = ["O", "O", "O", "X", "X", "X", "O", " ", "X"]

      expect(computer.cell_not_taken(board)).to eq(7)
    end
  end

  describe '#no_opponent_marker?' do
    it 'returns true if the combo does not contain any of the opponent marker and false if it does' do
      computer = Player::Computer.new("O")
      board = Board.new
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", "O"]

      expect(computer.no_opponent_marker?(board,[6,7,8])).to eq(true)
    end
  end

end
