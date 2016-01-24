class Game 
  attr_accessor :player_1, :player_2

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

  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O")) #need to define class Player first
    @player_1 = player_1
    @player_2 = player_2
    # @board = board || Array.new(9, " ")
  end

  def board
    Board.display    
  end

  def current_player
    Board.turn_count % 2 == 0 ? "X" : "O"
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
   winner != nil ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def winner 
    WIN_COMBINATIONS.each do |x, y|
      y.detect do 
        if y[0] == "X" && y[1] == "X" && y[2] == "X"
          return "X wins!"
        elsif y[0] == "O" && y[1] == "O" && y[2] == "O"
          return "O wins!"
        else
          nil
        end
      end
    end
  end

  def turn
    until won? || draw?
      input = gets.chomp   # -1  ?
      Board.position(input)
      current_player
    end
  end

  def play 
    turn 

    if winner
      winner
    else
      "Cats Game!"
    end
  end








end #end class Game