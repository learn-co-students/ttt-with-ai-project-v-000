class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

    def current_player
      if self.board.turn_count % 2 == 0
         @player_1
      else @player_2
      end
    end

    def won?
      WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = self.board.cells[win_index_1]
         position_2 = self.board.cells[win_index_2]
         position_3 = self.board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
           return win_combination
             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
           return win_combination
         end
       end
      false
     end

     def draw?
       if self.board.cells.all?{|a| a != " "} && !self.won?
        true
      else false
      end
    end

    def over?
     won? || draw?
    end

    def winner
       if won? == false
         nil
   else won?.each do |position|
       return self.board.cells[position]
       end
      end
    end

    def turn
      player = self.current_player
      index = player.move(board)
      #binding.pry
      if self.board.valid_move?(index)
        self.board.update(index, player)
        self.board.display
      else
        turn
      end
    end


    def play
      self.board.display
      until over?
        turn
    end
     if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
      end
    end

  def self.start

    puts "Welcome to Tic Tac Toe!"
    puts "Do you want to play a 0, 1, or 2 player game? Or, type 'exit' to quit"

    game_choice = " "
    while game_choice != "exit"
      game_choice = gets.chomp #get the user's desired game mode


      if game_choice == "2"
        puts "Decide who goes first as X...."
        puts "X make your move:"
        two_players = self.new
        two_players.play
        puts "Do you want to play a 0, 1, or 2 player game? Or, type 'exit' to quit"
      elsif game_choice == "1"
        puts "Who should go first as X? 1: Human or 2: Computer?"
        player_choice = gets.chomp
        if game_choice == "1" && player_choice == "1"
          one_player = self.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          one_player.play
          puts "Do you want to play a 0, 1, or 2 player game? Or, type 'exit' to quit"
        elsif game_choice == "1" && player_choice == "2"
          one_player = self.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          one_player.play
          puts "Do you want to play a 0, 1, or 2 player game? Or, type 'exit' to quit"
        end
      elsif game_choice == "0"
        zero_player = self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
        zero_player.play
        puts "Do you want to play a 0, 1, or 2 player game? Or, type 'exit' to quit"
      end
    end #end of while loop
  end

end
