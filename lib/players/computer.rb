class Computer < Player

  def move(board)
    if !board.taken?(5)
      5
    else
      strategy(board) + 1
    end
  end

  def strategy(board)
    win_or_block_adversary(board, self.token) || win_or_block_adversary(board, self.adversary_token) || go_corner?(board, token) || go_randomn
  end

  def winning_combi(board, token)
    Game::WIN_COMBINATIONS.detect do |combinations|
      result = combinations.collect do |index|
        board.cells[index]
      end
      result.count {|index| index == token} == 2 && result.include?(" ")
    end
  end

  def find_empty_spot(array)
    index = nil
    array.each_with_index do |v, i|
      index = i if v == " "
    end
    index
  end

  def win_or_block_adversary(board, token)
    if winning_combi(board, token)
      find_empty_spot(winning_combi(board, token))
    end
  end

  def go_corner?(board, token)
    if [0, 2, 6, 8].none? {|index| board.cells[index] == token}
      [0, 2, 6, 8].sample
    end
  end

  def go_randomn
    (0..8).to_a.sample
  end

  def adversary_token
    self.token == "X" ? "O" : "X"
  end

end
