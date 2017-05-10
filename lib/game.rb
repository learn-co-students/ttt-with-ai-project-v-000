class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    # binding.pry
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    x_moves = self.board.cells.select {|moves| moves == "X"}
    o_moves = self.board.cells.select {|moves| moves == "O"}
    x_moves.size == o_moves.size ? self.player_1 : self.player_2
  end

  def over?
    !self.board.cells.include? " " #true for a draw
  end



  def won?
  # binding.pry
    WIN_COMBINATIONS.find do |win_combination|
      # binding.pry
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      # (position_1 == "X" || position_1 == "O") &&
      # binding.pry
      position_1 == position_2 && position_2 == position_3 && self.board.taken?(win_index_1 +1)
    end
  end

  def draw?
    over? && won? == nil
  end

  def winner
    # binding.pry
    if won? != nil
      winning_position = won?
      winning_index = winning_position[0]
      # binding.pry
      self.board.cells[winning_index]
    else
      nil
    end
  end

  def turn
    # binding.pry
    puts "Please enter 1-9:"
    # ARGV.clear
    input = gets.strip
    # if board.valid_move?(input)
    #   board.update(input, player_1.token)
    # else
    #   turn
    # end
  end
end
