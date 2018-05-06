require 'spec_helper'

describe 'Players::Computer' do
  let(:board){Board.new}
  let(:computer){Players::Computer.new("X")}
  
  it 'inherits from Player' do
    expect(Players::Computer.ancestors).to include(Player)
  end

  describe '#move' do
    it 'returns a valid position for the computer to move' do
      # computer = Players::Computer.new("X")
      # board = Board.new

      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      computer_move = computer.move(board)

      expect(valid_moves).to include(computer_move)
    end
  end

  describe '#create_cheat_sheet' do
    it 'creates a cheat_sheet from WIN_COMBINAtIONS and the current board' do
      board.cells = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
      turn1 = [["1","2","3"], 
               ["4","X","6"], 
               ["7","8","9"], 
               ["1","4","7"], 
               ["2","X","8"], 
               ["3","6","9"], 
               ["1","X","9"], 
               ["3","X","7"]]
      
      expect(computer.create_cheat_sheet(board)).to eq(turn1)
      
      board.cells = [" ", " ", "O", " ", "X", " ", " ", " ", " "]
      turn2 = [["1","2","O"], 
               ["4","X","6"], 
               ["7","8","9"], 
               ["1","4","7"], 
               ["2","X","8"], 
               ["O","6","9"], 
               ["1","X","9"], 
               ["O","X","7"]]
      
      expect(computer.create_cheat_sheet(board)).to eq(turn2)
      
      board.cells = [" ", " ", "O", "O", "X", "X", " ", " ", "X"]
      turn5 = [["1","2","O"], 
                ["O","X","X"], 
                ["7","8","X"], 
                ["1","O","7"], 
                ["2","X","8"], 
                ["O","X","X"], 
                ["1","X","X"], 
                ["O","X","7"]]
      
      expect(computer.create_cheat_sheet(board)).to eq(turn5)
      
      board.cells = ["O", "X", "O", "O", "X", "X", " ", " ", "X"]
      turn7 = [["O","X","O"], 
                ["O","X","X"], 
                ["7","8","X"], 
                ["O","O","7"], 
                ["X","X","8"], 
                ["O","X","X"], 
                ["O","X","X"], 
                ["O","X","7"]]
      
      expect(computer.create_cheat_sheet(board)).to eq(turn7)
      
    end
  end
  
  describe "#win_imminent?" do 
    it "it returns an array where there are two tokens and an empty space" do 
      cheat_sheet = [["1","2","O"], 
                     ["O","X","X"], 
                     ["X","8","9"], 
                     ["1","O","X"], 
                     ["2","X","8"], 
                     ["O","X","9"], 
                     ["1","X","9"], 
                     ["3","X","X"]]
      
      win_array = ["3", "X", "X"]
      
      expect(computer.win_imminent?(cheat_sheet)).to eq(win_array)
      
      cheat_sheet = [["1","2","O"], 
                     ["O","X","X"], 
                     ["X","8","9"], 
                     ["1","O","X"], 
                     ["X","2","X"], 
                     ["O","X","9"], 
                     ["1","X","9"], 
                     ["3","O","X"]]
      
      win_array = ["X", "2", "X"]
      
      expect(computer.win_imminent?(cheat_sheet)).to eq(["X", "2", "X"])
      
      computer_o = Players::Computer.new("O")
      cheat_sheet = [["1","2","O"], 
                     ["O","3","6"], 
                     ["X","8","9"], 
                     ["1","O","O"], 
                     ["X","2","4"], 
                     ["7","8","9"], 
                     ["1","X","9"], 
                     ["3","O","X"]]
                     
      expect(computer_o.win_imminent?(cheat_sheet)).to eq(["1", "O", "O"])
    end
    
    it "returns nil if no winning array is found" do 
       cheat_sheet = [["1","2","O"], 
                     ["O","X","X"], 
                     ["X","8","9"], 
                     ["1","O","X"], 
                     ["X","2","4"], 
                     ["O","X","9"], 
                     ["1","X","9"], 
                     ["3","O","X"]]
          
        expect(computer.win_imminent?(cheat_sheet)).to be_falsey 
      end
    end
    
  describe "#block?" do 
    it "returns an array where there are two opponent's tokens and an empty space" do
      cheat_sheet = [["1","2","O"], 
                     ["O","X","O"], 
                     ["X","8","9"], 
                     ["1","O","O"], 
                     ["X","2","4"], 
                     ["O","X","9"], 
                     ["1","X","9"], 
                     ["3","O","X"]]
      
      expect(computer.block?(cheat_sheet)).to match_array(["1", "O", "O"])
      
      
      cheat_sheet = [["1","2","O"], 
                     ["O","5","O"], 
                     ["X","8","9"], 
                     ["1","X","O"], 
                     ["X","2","4"], 
                     ["O","X","9"], 
                     ["1","X","9"], 
                     ["3","O","X"]]
      
      expect(computer.block?(cheat_sheet)).to match_array(["O", "5", "O"])
      
      computer2 = Players::Computer.new("O")
      board.cells = ["X", " ", "O", " ", "X", " ", " ", " ", " "]
      cheat_sheet = computer2.create_cheat_sheet(board)
      
      expect(computer2.block?(cheat_sheet)).to eq(["X","X","9"])
    end
    it "returns nil if no block combination is detected" do 
      cheat_sheet = [["1","2","O"], ["O","5","8"], ["X","8","9"], ["1","X","O"], ["X","2","4"], ["O","X","9"], ["1","X","9"], ["3","O","X"]]
    
      expect(computer.block?(cheat_sheet)).to be_falsey
    end
  end

  describe "#move" do 
    it "returns a valid move" do 
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      board.cells = ["X", " ", "O", "O", " ", "X", " ", " ", " "]
    
      expect(valid_moves).to include(computer.move(board))
    end
  end
  
   describe "#move" do 
    it "if not the first turn, it first checks for a win through #win_imminent? and returns a valid move" do
      board.cells = ["X", " ", "O", "O", "X", " ", " ", " ", " "]
      
      expect(computer.move(board)).to eq("9")
    end
    
    it "then checks if a block is needed through #block?" do 
      computer_o = Players::Computer.new("O")
      board.cells = ["X", " ", "O", " ", "X", " ", " ", " ", " "]
      
      expect(computer_o.opponent_token).to eq("X")
      expect(computer_o.move(board)).to eq("9")
    end
  end
  
  describe "#opponent_token" do 
    it "assigns the opponent's token according to the computer's token" do 
      
      expect(computer.opponent_token).to eq("O")
      
      computer2 = Players::Computer.new("O")
      
      expect(computer2.opponent_token).to eq("X")
    end
  end
end
