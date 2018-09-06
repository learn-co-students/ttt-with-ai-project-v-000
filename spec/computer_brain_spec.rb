require 'spec_helper'

describe "ComputerBrain" do
  let(:brain){ComputerBrain.new}

  describe '#move' do
    it 'returns a position string "1" - "9"' do
      expect(brain).to respond_to(:move)
      expect(["1", "2", "3" , "4", "5", "6", "7", "8", "9"]).to include(brain.move)
    end
  end

  describe '#find_side_move' do
    let(:board){Board.new}
    
    it 'finds an open "side" cell on an empty board' do
      expect(["2", "4", "6", "8"]).to include(brain.find_side_move(board))
    end
    
    
    it 'finds an open "side" cell on a board with one side left' do
      board.cells = ["X", "X", "X", "X", "O", "O", "X", " ", "O"]
      
      expect(brain.find_side_move(board)).to eq("8")
    end
    
    
  end

  
end
