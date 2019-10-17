class Game
  
  attr_accessor :board, :player_1, :player_2, :cells
  
  WIN_COMBINATIONS  = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7 ], [2, 5, 8], [0, 4, 8], [2, 4, 6], [1, 4, 7]]
  
  def initialize(player_1 = Players::Human.new, player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def board
    @board
  end
  
  def current_player
    player_one_array = []
    player_two_array = []
    x = player_1.token
    y = player_2.token
    board.cells.each do |item|
      if item == x 
        player_one_array << x 
        elsif item == y 
        player_two_array << y 
      end
    end
    if player_one_array.length > player_two_array.length
      player_2
      elsif player_two_array.length > player_one_array.length
      player_1
      elsif player_one_array.length == player_two_array.length
      player_1
    end
  end
  
  def won?
    y = []
    #binding.pry
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X")
        y << combo
        elsif (board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O")
        y << combo
      end
    end
      if y.length > 0 
        y[0]
      else 
        false
    end
  end
  
  def draw?
    if self.won? == false 
      true 
    end
  end
  
  def over?
    if board.cells.include?(" ")
      false
      elsif self.won? || self.draw?
      true
    end
  end
  
  def winner
    #binding.pry
    x = self.won?
    if x == false
      nil
    else
      board.cells[x[0]]
    end
  end
  
  def turn
    count = 0
    while count == 0 || count.even?
    a = self.player_1.move(board.cells)
    if (a.to_i < 10) || (a.to_i > 0)
      count += 1
      end
    end
    while count.odd?
    b = self.player_2.move(board.cells)
    if (b.to_i < 10) || (b.to_i > 0)
      count += 1
    end
    end
  end
end