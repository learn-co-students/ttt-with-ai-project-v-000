require 'spec_helper'

describe 'Player::Computer' do
  it 'inherits from Player' do
    expect(Player::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    before do
      @computer = Player::Computer.new("X")
      @board = Board.new
    end

    it 'returns a valid position for the computer to move' do
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = @computer.move(@board)
      expect(valid_moves).to include(computer_move)
    end

    it 'returns a move ajacent to one of its previous moves' do
      @board.update(1, @computer)
      computer_move = @computer.move(@board)
      expect(["4", "5", "2"]).to include(computer_move)
    end

    it 'returns a winning move if one is possible' do
      @board.update(1, @computer)
      @board.update(2, @computer)
      computer_move = @computer.move(@board)
      expect(computer_move).to eq("3")
    end
  end
end
