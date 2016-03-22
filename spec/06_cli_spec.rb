require 'spec_helper'

describe "CLI" do
  let(:cli){CLI.new}

  describe '#valid_players?' do
    it 'should return true for a valid number of players' do
      expect(cli.valid_players?("0")).to be true
      expect(cli.valid_players?("1")).to be true
      expect(cli.valid_players?("2")).to be true
    end

    it 'should return false for an invalid number of players' do
      expect(cli.valid_players?("10")).to be_falsey
      expect(cli.valid_players?("Dog")).to be_falsey
    end
  end

end