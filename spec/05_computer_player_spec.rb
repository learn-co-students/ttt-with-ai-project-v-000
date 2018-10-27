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

    it 'returns a way to save the day' do
      computer = Players::Computer.new("O")
      board = Board.new
      game = Game.new(Players::Human.new("X"), computer, board)
      game.board.cells = ["X", "O", "O", "X", " ", " ", " ", " ", " "]

      valid_moves = ["7"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end
end
