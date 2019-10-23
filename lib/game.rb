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
    arr_1 = []
    arr_2 = []
    board.cells.each do |item|
      if item == "X"
        arr_1 << item
        elsif item == "O"
        arr_2 << item
      end
    end
    if arr_1.length > arr_2.length
      self.player_2
      elsif arr_1.length < arr_2.length
      self.player_1
      elsif arr_1.length == arr_2.length
      self.player_1
    end
  end
  
  def won?
    y = []
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
    if self.won? == false  && board.cells.include?(" ") == false
      true
    end
  end
  
  def over?
    self.won? || self.draw?
  end
  
  def winner
    x = self.won?
    if x == false
      nil
    else
      board.cells[x[0]]
    end
  end
  
  def turn
    a = current_player.move(board)
    if board.valid_move(a)
      board.update(a, current_player)
      board.display
    end
    while !board.valid_move?(a)
      puts "Please enter a valid position:"
      b = gets.strip
      if board.valid_move?(b)
        board.update(b, current_player)
        board.display
      end
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end
end

  
  
  #def turn
    #a = current_player.move(board)
    #if board.valid_move?(a)
      #board.update(input, current_player)
      #elsif !board.valid_move?(a)
        #until board.valid_move?(input)
          #puts "Enter input again:"
          #input = gets.strip
          #if board.valid_move?(input)
            #board.update(input, current_player)
          #end
        #end
      #end
    #end
  
    #def turn
    #a = current_player.move(board)
    #if board.valid_move?(a)
      #board.update(a, current_player)
#<<<<<<< HEAD
    #else
      #self.turn

    #else
      #turn

  
  #def play
    #while !over?
    #turn
    #end
    #if won?
      #puts "Congratulations #{self.winner}!"
      #elsif draw?
      #puts "Cat's Game!"
    #end
  #end
#end
  
  #def play
    #while !over?
    #turn
    #end
    #if won?
      #puts "Congratulations #{self.winner}!"
      #elsif draw?
      #puts "Cat's Game!"
      #end
    #end
    
  #def game_chooser(input)
    #input_b = " "
    #if (input == "2") || (input == "3")
      #puts "Would you like to be X (Player 1), or O (Player 2)?"
      #puts "Enter your selection(X or O):"
      #input_b = gets.strip
      #end
      
    #if (input == "1")
      #Game.new(player_1 = Players::Computer.new, player_2 = Players::Computer.new("O"), board = Board.new).play
      #elsif (input == "2") && (input_b== "X")
      #Game.new(player_1 = Players::Human.new, player_2 = Players::Computer.new("O"), board = Board.new).play
      #elsif (input == "2") && (input_b == "O")
      #Game.new(player_1 = Players::Computer.new, player_2 = Players::Human.new("O"), board = Board.new).play
      #elsif (input == "3") && (input_b == "X")
      #Game.new(player_1 = Players::Human.new, player_2 = Players::Human.new, board = Board.new).play
      #elsif (input == "2") && (input_b == "O") 
      #Game.new(player_1 = Players::Human.new, player_2 = Players::Computer.new("O"), board = Board.new).play
    #end
  #end
#end