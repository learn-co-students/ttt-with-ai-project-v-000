require 'spec_helper'

describe 'Players::Human' do
  it 'inherits from Player' do
    expect(Players::Human.ancestors).to include(Player)
  end

  describe '#move' do
    it 'asks the user for input and returns it' do
      human = Players::Human.new("X")
      allow($stdout).to receive(:puts)

      expect(human).to receive(:gets).and_return("1")

      expect(human.move([])).to eq("1")
    end
  end
end
