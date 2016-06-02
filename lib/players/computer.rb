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

  #
  # def turn_1
  #   board.valid_move?(5) ? board.update(5, game.current_player) : board.update(1, game.current_player)
  # end
  #
  # def number_element_in_array(array, element)
  #   array.count {|cell| cell == element}
  # end
  #
  # def almost_winning_combi(token, board)
  #   WIN_COMBINATIONS.each do |combinations|
  #     index = nil
  #     result = combinations.collect {|position| board.cells[position]}
  #     if number_element_in_array(result, token) == 2 && number_element_in_array(result, " ") == 1
  #       result.each_with_index {|v, i| index = i if v == " "}
  #     end
  #     index == nil ? @empty_index = nil : @empty_index = combinations[index]
  #   end
  # end
  #
  # def turn_2 #!! this method must be changed toward the end
  #   token_adversary = game.non_current_player.token
  #   if board.cells[0] == token_adversary && board.cells[5] == token_adversary
  #     board.update(3, game.current_player)
  #   elsif board.cells[0] == token_adversary && board.cells[7] == token_adversary
  #     board.update(7, game.current_player)
  #   elsif board.cells[2] == token_adversary && board.cells[3] == token_adversary
  #     board.update(1, game.current_player)
  #   elsif board.cells[2] == token_adversary && board.cells[7] == token_adversary
  #     board.update(9, game.current_player)
  #   elsif board.cells[8] == token_adversary && board.cells[1] == token_adversary
  #     board.update(3, game.current_player)
  #   elsif board.cells[8] == token_adversary && board.cells[3] == token_adversary
  #     board.update(7, game.current_player)
  #   elsif board.cells[6] == token_adversary && board.cells[1] == token_adversary
  #     board.update(1, game.current_player)
  #   elsif board.cells[6] == token_adversary && board.cells[5] == token_adversary
  #     board.update(9, game.current_player)
  #   end
  # end
  #
  #
end
# @index = 0
# board.cells.find do |cell|
#   cell == " "
#   @index += 1
# end
# @index.to_s
# binding.pry
