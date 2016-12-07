require 'spec_helper'

describe 'win check' do
  it 'returns true if there is a winning combination' do
    game = Game.new

    expect(game.player_1).to be_a(Players::Computer)
    expect(game.player_1.token).to eq("X")

    expect(game.player_2).to be_a(Players::Computer)
    expect(game.player_2.token).to eq("O")

    expect(game.board.cells) #code out true board
  end

  it 'returns false if there is not a winning combination' do
    game = Game.new

    expect(game.player_1).to be_a(Players::Computer)
    expect(game.player_1.token).to eq("X")

    expect(game.player_2).to be_a(Players::Computer)
    expect(game.player_2.token).to eq("O")

    expect(game.board.cells) #code out false board
  end
end
