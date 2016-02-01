require 'pry'
require 'spec_helper'

describe 'Player::Computer' do

  describe '#get_potential_wins' do
    it 'returns the only win combination' do
      board = Board.new
      board.cells = ["X", " ", "X", "O", "O", "X", "X", "X", "O"]
      computer = Player::Computer.new("X")

      expect(computer.get_potential_wins(board)).to eq([0])
    end

    it 'returns five win combinations' do
      board = Board.new
      board.cells = ["X", "O", "X", " ", "X", " ", " ", "O", " "]
      computer = Player::Computer.new("X")

      expect(computer.get_potential_wins(board)).to eq([1,3,5,6,7]) 

    end

    it 'returns no win combinations if board is empty' do
      board = Board.new
      computer = Player::Computer.new("X")

      expect(computer.get_potential_wins(board)).to eq([])
    end
  end

  describe '#get_potential_defeats' do
    it 'returns the only defeat combination' do
      board = Board.new
      board.cells = ["X", " ", "X", "O", "O", "X", "X", "X", "O"]
      computer = Player::Computer.new("O")

      expect(computer.get_potential_defeats(board)).to eq([0])
    end

    it 'returns five defeat combinations' do
      board = Board.new
      board.cells = ["X", "O", "X", " ", "X", " ", " ", "O", " "]
      computer = Player::Computer.new("O")

      expect(computer.get_potential_defeats(board)).to eq([1,3,5,6,7]) 

    end

    it 'returns all no defeat combinations if board is empty' do
      board = Board.new
      computer = Player::Computer.new("O")

      expect(computer.get_potential_defeats(board)).to eq([])
    end
  end

  describe '#get_critical_combinations' do
    it 'returns the single critical win combination' do
      board = Board.new
      board.cells = ["X", " ", "X", "O", "O", " ", " ", " ", " "]
      potentials = [0,2,5]
      computer = Player::Computer.new("X")

      expect(computer.get_critical_combinations("X",potentials,board)).to eq([0])
    end

    it 'returns three critical combinations' do
      board = Board.new
      board.cells = ["X", "O", "O", " ", " ", "O", "X", " ", "X"]
      potentials = [2, 3, 6]
      computer = Player::Computer.new("X")

      expect(computer.get_critical_combinations("X",potentials, board)).to eq([2, 3, 6])
    end
  end
end
