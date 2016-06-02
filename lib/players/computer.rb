# require_relative '../../config/environment'
# require 'pry'

class Computer < Player

  def move(board)
    if !board.taken?('5')
      '5'
    else
      strategy(board) + 1
    end
  end

  def strategy(board)
    win_or_block_adversary(board, self.token) || win_or_block_adversary(board, self.adversary_token) || go_corner?(board, token) || go_randomn(board)
    # binding.pry
  end

  def winning_combi(board, token)
    Game::WIN_COMBINATIONS.detect do |combinations|
      result = combinations.collect do |index|
        board.cells[index]
      end
      result.count {|index| index == token} == 2 && result.include?(" ")
    end
  end

  def find_empty_spot(board,array)
    index = nil
    array.each do |position|
      if board.cells[position] == " "
        index = position
      end
    end
    index
  end

  def win_or_block_adversary(board, token)
    if winning_combi(board, token)
      find_empty_spot(board, winning_combi(board, token))
    end
  end

  def go_corner?(board, token)
    if [0, 2, 6, 8].none? {|index| board.cells[index] == token} == true
      position = [0, 2, 6, 8].sample
      board.taken?(position + 1) ? go_corner?(board, token) : position
    end
  end

  def go_randomn(board)
    position = (0..8).to_a.sample
    board.taken?(position + 1) ? go_randomn(board) : position
  end

  def adversary_token
    self.token == "X" ? "O" : "X"
  end

end

# board = Board.new
# # Array.new(9," ")
# board.cells[3] = "O"
# board.cells[4] = "O"
# computer = Computer.new("X")
# board.update(computer.move(board), computer)
# board.display
