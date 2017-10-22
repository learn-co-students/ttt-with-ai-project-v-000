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

  describe '#minimax' do
    it 'no errrs' do
      computer = Players::Computer.new("X")
      board = Board.new
      board_state = board.cells

      # computer.minimax(board_state)
      # expect(computer.scores).to eq([])
    end
  end

  describe '#won' do
    it 'no errrs' do
      computer = Players::Computer.new("X")
      board = Board.new
      board_state = board.cells
      board_state[0]  = "X"
      board_state[1] = "X"
      board_state[2] = "X"

      expect(computer.won?(board_state)).to eq([0,1,2])
    end
  end

  describe '#minimax' do
    it 'no errrs' do
      computer = Players::Computer.new("X")
      board = Board.new
      board_state = board.cells
      board_state[0] = " "
      board_state[1] = "X"
      board_state[2] = " "
      board_state[3] = " "
      board_state[4] = " "
      board_state[5] = "X"
      board_state[6] = "O"
      board_state[7] = "O"
      board_state[8] = "X"

      # expect(computer.score(board_state)).to eq(true)
      computer.minimax(board_state, 0, "O")
      expect(computer.choice).to eq(3)
    end
  end
end
