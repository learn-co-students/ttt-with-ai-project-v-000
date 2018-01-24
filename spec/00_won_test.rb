require 'spec_helper'

describe '#won?' do


  it 'TEST FAILED: returns the correct winning combination in the case of a win' do
    game = Game.new
    game.board.cells = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    expect(game.won?).to contain_exactly(1, 4, 7)
  end



# PROBLEM: doesn't work if O starts:
# 1. current_player and last_player are reversed

end
