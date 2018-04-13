class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"),board=Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    number_of_turns = self.board.cells.select {|turns| turns != " "}.count
    if number_of_turns.even?
      player_1
    else
      player_2
    end
  end

  def won?
    possible_winning_combination = WIN_COMBINATIONS.select do |combo|
      turn_1, turn_2, turn_3 = board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]
      turn_1 != " " && turn_2 == turn_1 && turn_3 == turn_2
    end
    if possible_winning_combination == []
      false
    elsif possible_winning_combination.count > 1
      possible_winning_combination.select do |combo|
        board.cells.min_by {|token| board.cells.count(token)} == board.cells[combo[0]]
      end.flatten
    else
      possible_winning_combination.flatten
    end
  end

  def winner
    if self.won? != false
      board.cells[self.won?[0]]
    end
  end

  def draw?
    board.full? && self.won? == false
  end

  def over?
    self.draw? || self.won?
  end

  def turn
    puts "Your turn, #{current_player.token}."
    board.display
    new_move = current_player.move(self.board)
    while board.valid_move?(new_move) != true
      puts "Invalid move, go again #{current_player.token}."
      new_move = current_player.move(self.board)
    end
    board.update(new_move, current_player)
  end

  def play
    while self.over? == false
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end

end
