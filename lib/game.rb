class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      return player_1 if player_1.token == "X"
      return player_2
    else
      return player_2 if player_2.token == "O"
      return player_1
    end
    # o_count = 0
    # x_count = 0
    # self.board.cells.each do |position|
    #   if position == "X"
    #     x_count += 1
    #   elsif position == "O"
    #     o_count += 1
    #   end
    # end
    # # # assume player_1 goes first regardless of his token
    # # if x_count == o_count
    # #   return player_1
    # # elsif x_count > o_count
    # #   return player_2 if player_2.token == "O"
    # # elsif o_count > x_count
    # #   return player_2 if player_2.token == "X"
    # # else
    # #   # in a real project, this would be refactored to raise an exception
    # #   return "Error! Do both players have the same token or did player 2 go before player 1?"
    # # end
    #
    # # assume X goes first regardless of which player it is
    # if x_count == o_count
    #   return player_1 if player_1.token == "X"
    #   return player_2 if player_2.token == "X"
    # elsif x_count > o_count
    #   return player_2 if player_2.token == "O"
    #   return player_1 if player_1.token == "O"
    # else
    #   # in a real project, this would be refactored to raise an exception
    #   return "Error! Do both players have the same token or did O go before X?"
    # end
  end

  def win_array
    WIN_COMBINATIONS.each do |win|
      ref = self.board.cells[win[0]]
      return [true, ref] if (ref == "X" || ref == "O") && self.board.cells[win[1]] == ref && self.board.cells[win[2]] == ref
    end
    [false, nil]
  end

  def won?
    # WIN_COMBINATIONS.each do |win|
    #   ref = self.board.cells[win[0]]
    #   return true if (ref == "X" || ref == "O") && self.board.cells[win[1]] == ref && self.board.cells[win[2]] == ref
    # end
    # false
    self.win_array[0]
  end

  def draw?
    # return false if self.won?
    # self.board.cells.each do |position|
    #     return false if position == " "
    # end
    # true
    return true if !self.won? && self.board.full?
  end

  def over?
    return true if self.won? || self.draw?
    false
  end

  def winner
    #first implementation
    # return nil if !self.won?
    # o_count = 0
    # x_count = 0
    # self.board.cells.each do |position|
    #   if position == "X"
    #     x_count += 1
    #   elsif position == "O"
    #     o_count += 1
    #   end
    # end
    # return "X" if x_count > o_count
    # return "O" if o_count > x_count
    # nil
    # second implementation
    # WIN_COMBINATIONS.each do |win|
    #   ref = self.board.cells[win[0]]
    #   return ref if (ref == "X" || ref == "O") && self.board.cells[win[1]] == ref && self.board.cells[win[2]] == ref
    # end
    # nil
    self.win_array[1]
  end

  def player_turn_prompt(current_player, player_num)
    valid = false
    while !valid do
      puts "Make your move, Player #{player_num}."
      self.board.display
      move = current_player.move(board)
      if self.board.valid_move?(move)
        self.board.update(move, current_player)
        valid = true
      else
        puts "Invalid move. Instructions for playing Tic-Tac-Toe can be found here: https://en.wikipedia.org/wiki/Tic-tac-toe"
      end
    end
  end

  def turn
    current_player = self.current_player # doing this assignment as an optimization as the current_player method requires a lot of computation
    if current_player == self.player_1
      player_turn_prompt(current_player, 1)
      # valid = false
      # while !valid do
      #   puts "Make your move, Player 1."
      #   self.board.display
      #   move = self.player_1.move(board)
      #   if self.board.valid_move?(move)
      #     self.board.update(move, player_1)
      #     valid = true
      #   else
      #     puts "Invalid move. Instructions for playing Tic-Tac-Toe can be found here: https://en.wikipedia.org/wiki/Tic-tac-toe"
      #   end
      # end
    elsif current_player == self.player_2
      player_turn_prompt(current_player, 1)
      # valid = false
      # while !valid do
      #   puts "Make your move, Player 2."
      #   self.board.display
      #   move = self.player_2.move(board)
      #   if self.board.valid_move?(move)
      #     self.board.update(move, player_2)
      #     valid = true
      #   else
      #     puts "Invalid move. Instructions for playing Tic-Tac-Toe can be found here: https://en.wikipedia.org/wiki/Tic-tac-toe"
      #   end
      # end
    else
      puts "Who are you?"
      # This would be an exception in a real project
      return "Invalid player!"
    end
  end

  def play
    while !self.over? do
      self.turn
    end

    if self.won?
      puts "Congratulations " + self.winner + "!" if self.winner != nil
      self.board.display
    else
      puts "Cats Game!"
      self.board.display
    end

  end



end
