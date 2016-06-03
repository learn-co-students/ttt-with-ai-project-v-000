require'pry'
class Game
  WIN_COMBINATIONS = [
                      [0,1,2],#Top Three
                      [3,4,5],#Middle Three
                      [6,7,8],#Bottom Three
                      [0,3,6],#L Vertical
                      [1,4,7],#M Vertical
                      [2,5,8],#R Vertical
                      [0,4,8],#L-R Diagonal
                      [6,4,2]#R-L Diagonal
                              ]
  attr_accessor :board, :player_1, :player_2, :winner, :name

  def initialize(player1 = Player::Human.new("X"), player2 = Player::Human.new("O"), board = Board.new )
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
      if draw? == true || won? == true
        true
      else
        false
      end
      #self.board.full?
  end

  def won?
    if win_x.length == 0 && win_o.length == 0
      false
    else
      true
    end
  end

  def win_x
    WIN_COMBINATIONS.select do |a, b, c|
      board.cells[a] == "X" && board.cells[b] == "X" && board.cells[c] == "X"  
    end
  end

  def win_o
    WIN_COMBINATIONS.select do |a, b, c|
      board.cells[a] == "O" && board.cells[b] == "O" && board.cells[c] == "O"  
    end
  end

  def draw?
    win_x.length+win_o.length == 0 && board.full? ? true : false
  end

  def winner
    if win_x.length > 0
      "X"
    elsif win_o.length > 0
      "O"
    else
      nil
    end
  end

  def turn
    #write a sperate method for turn when it's for Human or Computer players. Below is for Human. But it's calling move sooo
    # call PLAYER::COMPUTER? Idk

    # if current_player.class.name == "Player::Computer"
    #   puts "Player #{current_player.token}'s turn, Move: #{board.turn_count}"
    # else
    #   puts "Where would you like to go #{current_player.name}? Move: #{board.turn_count}"
    # end
    board.display
    input = self.current_player.move(@board)

    # board.valid_move?(input)
    # if board.valid_move?(input) == false
    #   input = current_player.move(@board)
    # end
    # board.update(input,current_player)



    if board.valid_move?(input)
      board.update(input,current_player)
    else
      puts "Not valid"
      # input = current_player.move(@board)
      turn
    end
    # board.update(input,current_player)
  end

  # not my turn method
  # def turn
  #   player_move = current_player.move(board)
  #   if board.valid_move?(player_move)
  #     board.update(player_move, current_player)
  #   else
  #   turn
  #   end
  # end

  def play
    until over? == true
      turn
    end
    if self.winner == nil
      puts "Cats Game!"
    else
      puts "Congratulations #{self.winner}!"
      #Congradulate the winner of the game, using the person with the most X or O combinations
      #Code in a play again option, so players don't have to re enter name
      board.display
    end
  end

  def start
    puts "Hey player!"
    puts "How many human players are we using today? 0/1 or 2?"
    num_players = gets.strip.to_i

      if num_players == 0
        #this plays as two players as well
        game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
        # player_1 = Player::Computer.new("X")
        # player_2 = Player::Computer.new("O")
        game.play

      elsif num_players == 1
        #this works as two players, but it finishes a game
        puts "Alright, so who's going to go first and play as X?"
        first = gets.strip
        game = Game.new(Player::Human.new("X"),Player::Computer.new("O"))
        game.player_1.name = first
        game.play
        
      elsif num_players == 2
        #this one works fine
        puts "Alright, so who's going to go first and play as X?"
        first = gets.strip

        player_1.name = first
        puts "Alright, so who's going to go second and play as O?"
        second = gets.strip
        player_2.name = second
        play
      end


  end





end