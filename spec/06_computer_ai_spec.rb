require 'pry'
require 'spec_helper'

describe 'Player::Computer' do

  describe '#potential_win_combinations' do
    it 'returns the only win combination' do
      board = Board.new
      board.cells = ["X", " ", "X", "O", "O", "X", "X", "X", "O"]
      computer = Player::Computer.new("X")

      expect(computer.potential_win_combinations(board)).to eq([0])
    end

    it 'returns five win combinations' do
      board = Board.new
      board.cells = ["X", "O", "X", " ", "X", " ", " ", "O", " "]
      computer = Player::Computer.new("X")

      expect(computer.potential_win_combinations(board)).to eq([1,3,5,6,7]) 

    end

    it 'returns all the win combinations (board is empty)' do
      board = Board.new
      computer = Player::Computer.new("X")

      expect(computer.potential_win_combinations(board)).to eq([0,1,2,3,4,5,6,7])
    end
  end

  describe '#potential_defeat_combinations' do
    it 'returns the only defeat combination' do
      board = Board.new
      board.cells = ["X", " ", "X", "O", "O", "X", "X", "X", "O"]
      computer = Player::Computer.new("O")

      expect(computer.potential_defeat_combinations(board)).to eq([0])
    end

    it 'returns five defeat combinations' do
      board = Board.new
      board.cells = ["X", "O", "X", " ", "X", " ", " ", "O", " "]
      computer = Player::Computer.new("O")

      expect(computer.potential_defeat_combinations(board)).to eq([1,3,5,6,7]) 

    end

    it 'returns all the defeat combinations (board is empty)' do
      board = Board.new
      computer = Player::Computer.new("O")

      expect(computer.potential_defeat_combinations(board)).to eq([0,1,2,3,4,5,6,7])
    end
  end

  describe '#critical_win_combinations' do
    it 'returns the single critical win combination' do
    board = Board.new
    board.cells = ["X", " ", "X", "O", "O", " ", " ", " ", " "]
    potentials = [0,2,5]
    computer = Player::Computer.new("X")

    expect(computer.critical_win_combinations(potentials,board)).to eq([0])

    end
  end

  describe '#critical_defeat_combinations' do
    it 'returns the single critical defeat combination' do
    board = Board.new
    board.cells = ["X", " ", "X", "O", "O", " ", " ", " ", " "]
    potentials = [0,2,5]
    computer = Player::Computer.new("O")

    expect(computer.critical_defeat_combinations(potentials,board)).to eq([0])

    end
  end





end
