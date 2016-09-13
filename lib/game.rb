class Game

  attr_accessor :board, :player_1, :player_2#, :cli

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
     player_1.token == "X" ? player_1 : player_2
   else
     player_2.token == "O" ? player_2 : player_1
   end
  end

  def win_array
    WIN_COMBINATIONS.each do |win|
      ref = self.board.cells[win[0]]
      return [true, ref] if (ref == "X" || ref == "O") && self.board.cells[win[1]] == ref && self.board.cells[win[2]] == ref
    end
    [false, nil]
  end

  def won?
    self.win_array[0]
  end

  def draw?
    return true if !self.won? && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
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
      self.player_turn_prompt(current_player, 1)

    elsif current_player == self.player_2
      self.player_turn_prompt(current_player, 1)
    else
      puts "Who are you?"

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
