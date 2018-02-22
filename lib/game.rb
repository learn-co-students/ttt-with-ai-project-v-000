class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  #horizontal combinations
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical combinations
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal combinations
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player #returns the current player, the player who should make the next move
    num_of_x = self.board.cells.find_all do |position|
      position == "X"
    end
    num_of_o = self.board.cells.find_all do |position|
      position == "O"
    end
    if num_of_x.size == num_of_o.size #if no one has played, it's X's turn
      player_1
    elsif num_of_x.size < num_of_o.size #if both players have played an equal number of times, it's X's turn
      player_1
    else
      player_2 #all other cases it is Y's turn
    end
  end

  def won?#returns the correct winning combination in the case of a win
    combination = nil
    WIN_COMBINATIONS.each do |array|
      #get the position values(X or O) for each element of this array
      position_array = [board.cells[array[0]],board.cells[array[1]],board.cells[array[2]]]

      all_x = position_array.all? do |element|
        element == "X"
      end

      all_o = position_array.all? do |element|
        element == "O"
      end

      if all_x || all_o
        combination =  array
      end
    end
    combination
  end


  def draw?#returns true if the game is a draw
    true if self.board.full? && !(self.won?)
  end

  def over? #returns true if the game is over
    if (self.board.full? || self.won? || self.draw?)
      true
    else
      false
    end

  end


  def winner #returns whichever player is the winner
    if won?
      if board.cells[won?[0]] == "X"
        "X"
      else
        "O"
      end
    end
  end

  def start #sets up the game based on user input and then starts the game with play
    puts "What kind of game would you like to play? 0,1, or 2 player game."
    kind = gets.strip.to_i
    if kind == 0
      puts "computer plays itself"
      self.player_1=Players::Computer.new("X")
      self.player_2=Players::Computer.new("O")
      self.play
    elsif kind == 1
      puts "you play the computer"
      puts "Who should go first and be X: you(1) or the computer(2)? Please enter 1 or 2"
      first_player = gets.strip.to_i
      if first_player == 1
        self.player_1=Players::Human.new("X")
        self.player_2=Players::Computer.new("O")
      else
        self.player_1=Players::Computer.new("X")
        self.player_2=Players::Human.new("O")
      end
      self.play
    elsif kind == 2
      puts "you are playing somebody else"
      self.play
    end
  end

  def play #checks if the game is over, calls #display, calls#turn, congratulates winner
    until self.over?
      self.board.display
      self.turn
      self.board.display
    end
    if self.winner
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def turn #makes valid moves
    player = current_player
    the_move = player.move(self.board)
    if self.board.valid_move?(the_move) == true
      #if it is a valid move, then update the board with the move
      self.board.update(the_move,player)
    else #if it's not a valid move, you keep asking the player to make a move
      self.turn
    end
  end

end
