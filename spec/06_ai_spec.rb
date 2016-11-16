require 'spec_helper'

describe 'Computer' do
  it "has a cells attribute that can be written to with a board's cells" do
    computer = Players::Computer.new("X")
    board = Board.new
    computer.cells = board.cells

    expect(computer.cells).to match_array(Array.new(9, " "))
  end

  it "has an opponent" do
    computer1 = Players::Computer.new("X")
    computer2 = Players::Computer.new("O")

    expect(computer1.opponent).to eq("O")
    expect(computer2.opponent).to eq("X")
  end

  describe '#free_corner' do
    it "returns the index of a corner which is not taken" do
      computer = Players::Computer.new("X")

      boards = [
        ["X", "X", " ", " ", " ", " ", " ", " ", " "],
        [" ", " ", "X", " ", " ", " ", "X", " ", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", " "],
        ["X", "O", "X", "O", "O", "X", "X", "X", "O"]
      ]

      computer.cells = boards[0]
      expect(computer.free_corner).to eq(2)

      computer.cells = boards[1]
      expect(computer.free_corner).to eq(0)

      computer.cells = boards[2]
      expect(computer.free_corner).to eq(6)

      computer.cells = boards[3]
      expect(computer.free_corner).to be_nil
    end
  end

  describe '#block_win?' do
    it "returns the index of a space you must block (or your opponent would get three in a row)" do
      computer = Players::Computer.new("O")

      block_boards = [
        ["X", "X", " ", " ", " ", " ", " ", " ", " "],
        [" ", "X", "X", " ", " ", " ", " ", " ", " "],
        [" ", " ", "X", " ", " ", " ", " ", " ", "X"],
        [" ", " ", "X", " ", " ", " ", "X", " ", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", " "]
      ]

      computer.cells = block_boards[0]
      expect(computer.block_win?).to eq(2)

      computer.cells = block_boards[1]
      expect(computer.block_win?).to eq(0)

      computer.cells = block_boards[2]
      expect(computer.block_win?).to eq(5)

      computer.cells = block_boards[3]
      expect(computer.block_win?).to eq(7)

      computer.cells = block_boards[4]
      expect(computer.block_win?).to eq(8)

    end

    it "returns nil if there isn't a space you must immediately block" do
      computer = Players::Computer.new("O")

      nil_boards = [
        [" ", " ", " ", " ", " ", " ", " ", " ", " "],
        ["X", "O", " ", " ", " ", " ", " ", " ", " "],
        [" ", "X", " ", " ", " ", " ", " ", " ", "X"],
        ["X", " ", " ", " ", "O", " ", " ", " ", "X"],
        [" ", "X", " ", " ", "O", " ", " ", " ", "X"],
        [" ", " ", " ", " ", " ", " ", "O", "X", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", "O"],
        ["X", "O", "X", " ", "O", " ", " ", " ", " "]
      ]

      nil_boards.each do |cells|
        computer.cells = cells
        expect(computer.block_win?).to be_nil
      end
    end
  end

  describe "#win_spots" do
    it "returns a list of indices the token can take to win" do
      computer = Players::Computer.new("X")

      win_boards = [
        ["X", "X", " ", " ", " ", " ", " ", " ", " "],
        [" ", "X", "X", " ", " ", " ", " ", " ", " "],
        [" ", " ", "X", " ", " ", " ", " ", " ", "X"],
        [" ", " ", "X", " ", " ", " ", "X", " ", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", " "]
      ]

      nil_boards = [
        [" ", " ", " ", " ", " ", " ", " ", " ", " "],
        ["X", "O", " ", " ", " ", " ", " ", " ", " "],
        [" ", "X", " ", " ", " ", " ", " ", " ", "X"],
        ["X", " ", " ", " ", "O", " ", " ", " ", "X"],
        [" ", "X", " ", " ", "O", " ", " ", " ", "X"],
        [" ", " ", " ", " ", " ", " ", "O", "X", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", "O"],
        ["X", "O", "X", " ", "O", " ", " ", " ", " "]
      ]

      computer.cells = win_boards[0]
      expect(computer.win_spots).to eq([2])

      computer.cells = win_boards[1]
      expect(computer.win_spots).to eq([0])

      computer.cells = win_boards[2]
      expect(computer.win_spots).to eq([5])

      computer.cells = win_boards[3]
      expect(computer.win_spots).to eq([7, 5, 4])

      computer.cells = win_boards[4]
      expect(computer.win_spots).to eq([8])

      nil_boards.each do |cells|
        computer.cells = cells
        expect(computer.win_spots).to match_array([])
      end
    end
  end

  describe "#fork_spots" do
    it "returns a list of indices that the token can take to 'fork'" do
      computer = Players::Computer.new("X")

      fork_boards = [
        [" ", " ", "X", " ", "O", " ", "X", " ", " "],
        [" ", "O", "X", " ", " ", " ", "X", " ", " "],
        [" ", " ", "X", " ", "O", " ", "X", " ", "O"],
        [" ", " ", "X", " ", "O", " ", "X", "O", " "],
        ["O", "X", " ", "O", " ", " ", "X", " ", " "],
        [" ", "O", "O", "X", " ", "X", " ", " ", " "],
        ["X", " ", " ", "O", " ", " ", "X", "O", " "]
      ]

      nil_boards = [
        [" ", " ", " ", " ", " ", " ", " ", " ", " "],
        ["X", "O", " ", " ", " ", " ", " ", " ", " "],
        [" ", "X", "O", " ", "O", " ", " ", " ", "X"],
        [" ", "O", " ", " ", " ", " ", "O", "X", "X"],
        ["X", "O", "X", "O", "O", "X", " ", "X", "O"]
      ]

      computer.cells = fork_boards[0]
      expect(computer.fork_spots).to match_array([0, 8])

      computer.cells = fork_boards[1]
      expect(computer.fork_spots).to match_array([0, 3, 5, 7, 8])

      computer.cells = fork_boards[2]
      expect(computer.fork_spots).to match_array([0])

      computer.cells = fork_boards[3]
      expect(computer.fork_spots).to match_array([0])

      computer.cells = fork_boards[4]
      expect(computer.fork_spots).to match_array([4, 7])

      computer.cells = fork_boards[5]
      expect(computer.fork_spots).to match_array([0, 6])

      computer.cells = fork_boards[6]
      expect(computer.fork_spots).to match_array([2, 4])

      nil_boards.each do |cells|
        computer.cells = cells
        expect(computer.fork_spots).to match_array([])
      end
    end
  end
end

[
 "X", " ", " ",

 "O", " ", " ",

 "X", "O", " "
]
