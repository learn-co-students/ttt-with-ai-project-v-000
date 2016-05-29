class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2, :token, :save_winner

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @counts = { " " => 9, "X" => 0, "O" => 0 }
    @save_winner = " "
  end

  def current_player
    self.board.turn_count.even? ?
    player_1 : player_2
  end

  def over?
    self.board.full?
  end

  def won?
    won = false
    WIN_COMBINATIONS.each_with_index do |win_combo, index|
      if self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[0]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[2]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
        won = true
        self.save_winner = self.board.cells[win_combo[0]]
      end
    end
    won
  end

  def draw?
    over? && !won?
  end

  def winner
    self.save_winner if won?
  end

  def turn
    input = current_player.move(current_player)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
      current_player
    else
      puts "Your input is not valid. Please input a location on the board (1 is the top row left-most column spot and 9 is bottom row right-most column) to select the location of your next move. Please check that this location is not taken."
      input = current_player.move(current_player)
      self.board.update(input, current_player)
      current_player
    end
  end

  def play
    turn
    over?
  end


end
