class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end
#this looks like it needs to be fixed
#I don't know why i did this
  def over?
    #!@board.cells.include?(" ")
    won? || draw?
  end

  def won?
    new_array = nil
    WIN_COMBINATIONS.collect do |array|
        if @board.cells[array[0]] == "X" && @board.cells[array[1]] == "X"  && @board.cells[array[2]] == "X"
          return array
          break
        elsif @board.cells[array[0]] == "O" && @board.cells[array[1]] == "O"  && @board.cells[array[2]] == "O"
          return array
          break
        else
          false
        end
    end
    new_array
  end

  def draw?
    @board.full? && !self.won? ? true : false
  end

  def winner
    won? ? @board.cells[won?[1]] : nil# == "O" ? "X" : "O"
  end

  def turn
       player = current_player
       move = player.move(@board)
       if @board.valid_move?(move)
         @board.update(move, player)
         @board.display
       else
         turn
       end
  end

  def play
    until over?
    turn
  end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
  end

  def start
    puts "Welcome to Tic Tac Toe CLI"
    puts "what will player 1 (X) be?"
    puts "put 1 for human anything else for computer"
    number = gets.strip
        if number.to_i == 1
          player_1 = Players::Human.new("X")
        else
          player_1 = Players::Computer.new("X")
        end
    puts "what will player 2 (O) be?"
    puts "put 1 for human else for computer"
    number = gets.strip
      if number.to_i == 1
        player_2 = Players::Human.new("X")
      else
        player_2 = Players::Computer.new("X")
      end
    game = Game.new(player_1, player_2, board = Board.new)
    game.play
  end
end
