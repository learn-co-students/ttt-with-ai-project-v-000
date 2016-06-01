class Strategy

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_accessor :empty_index
  attr_reader :board, :game

  def initialize(board, game)
    @board = board
    @game = game
  end

  def turn_1
    board.valid_move?(5) ? board.update(5, game.current_player) : board.update(1, game.current_player)
  end

  def number_element_in_array(array, element)
    array.count {|cell| cell == element}
  end

  def almost_winning_combi(token)
    WIN_COMBINATIONS.each do |combinations|
      index = nil
      result = combinations.collect {|position| board.cells[position]}
      if number_element_in_array(result, token) == 2 && number_element_in_array(result, " ") == 1
        result.each_with_index {|v, i| index = i if v == " "}
      end
      index == nil ? self.empty_index = nil : self.empty_index = combinations[index]
    end
  end

  def turn_2 #!! this method must be changed toward the end
    token_adversary = game.non_current_player.token
    if board.cells[0] == token_adversary && board.cells[5] == token_adversary
      board.update(3, game.current_player)
    elsif board.cells[0] == token_adversary && board.cells[7] == token_adversary
      board.update(7, game.current_player)
    elsif board.cells[2] == token_adversary && board.cells[3] == token_adversary
      board.update(1, game.current_player)
    elsif board.cells[2] == token_adversary && board.cells[7] == token_adversary
      board.update(9, game.current_player)
    elsif board.cells[8] == token_adversary && board.cells[1] == token_adversary
      board.update(3, game.current_player)
    elsif board.cells[8] == token_adversary && board.cells[3] == token_adversary
      board.update(7, game.current_player)
    elsif board.cells[6] == token_adversary && board.cells[1] == token_adversary
      board.update(1, game.current_player)
    elsif board.cells[6] == token_adversary && board.cells[5] == token_adversary
      board.update(9, game.current_player)
    end
  end

  def move_player_2
    if self.almost_winning_combi(game.current_player.token) != nil
      board.update(self.almost_winning_combi(game.current_player.token), game.current_player)
    elsif self.almost_winning_combi(game.non_current_player.token) != nil
      board.update(self.almost_winning_combi(game.non_current_player.token), game.current_player)
    elsif board.turn_count == 0
      self.turn_1
    elsif board.turn_count == 3
      self.turn_2
    else
      for index in 1..9
        if board.valid_move?(index)
          board.update(index, current_player)
          break #allow to break as soon as we found the first solution
        end
      end
    end
  end

end

# POSITION_REF = [1, 1]

# def cross_pattern
#   token_adversary = game.non_current_player.token
#   if (board.cells[0] == token_adversary && board.cells[8] == token_adversary) || (board.cells[2] == token_adversary && board.cells[6] == token_adversary)
#     true
#   else
#     false
#   end
# end

# def add_array(array_1, array_2)
#   counter = 0
#   array_new = []
#   array_1.each do |item|
#     array_new << item + array_2[counter]
#     counter += 1
#   end
#   array_new
# end
#
#
# def coordinates(position) #position must be between (1, 9)
#   coordinates = []
#   v = (position / 3).to_i
#   v += 1 if position % 3 != 0
#   coordinates << v
#
#   h = position % 3
#   h += 3 if h == 0
#   coordinates << h
#   coordinates
# end
#
# def position(coordinates) #will return an int between (1,9)
#   v = coordinates[0]
#   h = coordinates[1]
#   (v - 1) * 3 + h
# end
