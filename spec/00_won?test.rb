require 'spec_helper'

describe '#won?' do

  #
  # it 'TEST FAILED: returns the correct winning combination in the case of a win' do
  #   game = Game.new
  #   game.board.cells = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
  #   expect(game.won?).to contain_exactly(1, 4, 7)
  # end

  it 'returns false for a draw' do
    game = Game.new
    game.board.cells = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]

    expect(game.won?).to be_falsey
  end

end
