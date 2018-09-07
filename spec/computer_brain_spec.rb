require 'spec_helper'

describe "ComputerBrain" do
  let(:brain){ComputerBrain.new}
  let(:board){Board.new}
  

  describe '#find_second_move_move' do

    it 'always moves to a corner on second move' do
      board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(["1", "3", "7", "9"]).to include(brain.find_second_move_move(board))
    end
    
    it 'returns nil if not the second move' do
      board.cells = [" ", "X", " ", "X", "O", "X", "O", "X", "O"]
      expect(brain.find_side_move(board)).to eq(nil)
    end

  end

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
    
    it 'finds returns nil if no blocking move exist' do
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(brain.find_blocking_move(board)).to eq(nil)
    end

  end
  
  describe '#find_winning_move' do
    
    it 'finds winning move if such exists' do
      board.cells = ["X", " ", " ", " ", "O", "X", " ", "O", "X"]
      expect(brain.find_winning_move(board)).to eq("2")
    end
    
    it 'finds winning move if such exists' do
      board.cells = ["X", "O", "X", "X", "O", "O", " ", " ", " "]
      expect(brain.find_winning_move(board)).to eq("7")
    end
    
    it 'finds winning move if such exists' do
      board.cells = ["X", " ", " ", " ", "O", "O", "X", " ", "O"]
      expect(brain.find_winning_move(board)).to eq("4")
    end
    
    it 'finds returns nil if no blocking move exist' do
      board.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      expect(brain.find_winning_move(board)).to eq(nil)
    end

  end
  
  describe 'move' do

    it 'returns a valid move' do
      expect(["1", "2", "3", "4", "5", "6", "7", "8", "9"]).to include(brain.move(board))
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
