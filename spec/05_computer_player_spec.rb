require 'spec_helper'

describe 'Player::Computer' do
  it 'inherits from Player' do
    expect(Player::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      computer = Player::Computer.new("X")
      board = GameTree.new.generate
      expect(computer.move(board)).to be_a_kind_of(Board)
    end
  end
end
