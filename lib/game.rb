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
  #def initialize(player_1, player_2, board)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def turn_count
    turns = 0
    self.board.cells.each do |board_position|
      if board_position == "O" || board_position == "X"
        turns += 1
      end
    end
    turns
  end

  def current_player
    number_of_turns = turn_count
    if number_of_turns % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    empty_board = self.board.cells.all? do |position|
      position == " "
    end

    if empty_board
      return false
    end

    WIN_COMBINATIONS.each do |combination|

      winning_combination = []

      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winning_combination = [win_index_1, win_index_2, win_index_3]
        return winning_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winning_combination = [win_index_1, win_index_2, win_index_3]
        return winning_combination
      end
    end
    return false
  end

  def full?
    full_board = self.board.cells.all? do |position|
      position == "X" || position == "O"
    end

    if full_board
      true
    else
      false
    end
  end

  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if draw? == true || won? != false
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combination|

      winning_combination = []

      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return player_1.token
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return player_2.token
      end
    end
    return nil
  end

  def turn
    player = current_player
    index = player.move(self.board)
    if self.board.valid_move?(index) == true
      self.board.update(index, current_player)
      current_player
      self.board.display
    else
      puts "Invalid input"
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
