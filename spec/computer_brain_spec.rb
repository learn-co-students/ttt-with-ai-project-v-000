require 'spec_helper'

describe "ComputerBrain" do
  let(:brain){ComputerBrain.new}
  let(:board){Board.new}
  

  describe '#find_side_move' do

    it 'finds an open "side" cell on an empty board' do
      expect(["2", "4", "6", "8"]).to include(brain.find_side_move(board))
    end
    
    
    it 'finds an open "side" cell on a board with one side left' do
      board.cells = [" ", "X", " ", "O", " ", "X", " ", " ", " "]
      expect(brain.find_side_move(board)).to eq("8")
    end
    
    it 'returns nil if sides already taken' do
      board.cells = [" ", "X", " ", "X", "O", "X", "O", "X", "O"]
      expect(brain.find_side_move(board)).to eq(nil)
    end

  end

  describe '#find_corner_move' do

    it 'finds an open "corner" cell on an empty board' do
      expect(["1", "3", "7", "9"]).to include(brain.find_corner_move(board))
    end
    
    it 'finds an open "corner" cell on a board with one corner left' do
      board.cells = [" ", "X", "X", "X", " ", "O", "X", " ", "O"]
      expect(brain.find_corner_move(board)).to eq("1")
    end
    
    it 'returns nil if corners already taken' do
      board.cells = ["X", "O", "X", "O", "X", "O", "X", " ", "O"]
      expect(brain.find_corner_move(board)).to eq(nil)
    end


  end
  
  describe '#find_center_move' do
    it 'finds the open"center" cell on an empty board' do
      expect(["5"]).to include(brain.find_center_move(board))
    end
    
    it 'returns nil if center already taken' do
      board.cells = [" ", "X", "X", "X", "X", "O", "X", " ", "O"]
      expect(brain.find_center_move(board)).to eq(nil)
    end
  end
  
  describe '#find_blocking_move' do
    
    it 'finds move to block an opponent win if such exists' do
      board.cells = ["X", " ", "X", " ", "O", " ", " ", " ", " "]
      expect(brain.find_blocking_move(board)).to eq("2")
    end
    
    it 'finds move to block an opponent win if such exists' do
      board.cells = ["X", " ", "O", " ", "O", " ", "X", " ", "X"]
      expect(brain.find_blocking_move(board)).to eq("8")
    end
    
    it 'finds move to block an opponent win if such exists' do
      board.cells = ["X", " ", "O", " ", "X", " ", " ", " ", "O"]
      expect(brain.find_blocking_move(board)).to eq("6")
    end

  end
  
  #utilities
  describe '#foe_token' do
    it 'determines from an empty board that foe token is "O" (since current player must be "X" cause "X" goes first!)' do
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(brain.foe_token(board)).to eq("O")
    end
    
    it 'determines from a board that foe token is "X" (since current play must be "O")' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(brain.foe_token(board)).to eq("X")
    end
    
    it 'determines from a board that foe token is "X" (since its "O" turn )' do
      board.cells = ["X", "O", "X", "O", "X", " ", " ", " ", " "]
      expect(brain.foe_token(board)).to eq("X")
    end
  end
  
  
end
