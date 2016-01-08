require 'spec_helper'

describe 'Player::Human' do
  it 'inherits from Player' do
    expect(Player::Human.ancestors).to include(Player)
  end

  describe '#move' do
    it 'asks the user for input and returns it' do
      # human = Game.new.player_1 #modified    me changing this didn't fix it
      human = Player::Human.new("X") #original
      allow($stdout).to receive(:puts)

      expect(human).to receive(:gets).and_return("1") 

      expect(human.move([])).to eq("1") #why is it passing in an empty array
    end
  end
end
