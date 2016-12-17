require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS =
    [
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
      #This initialize creates whole new objects thru the config methods (one a descendant of Players that creates a human object and then another one that creates a computer object)
      # self = #<Game:0x000000011eb620>
      @player_1 = player_1
      #<Players::Human:0x000000011eb788 @token="X">
      @player_2 = player_2
      #<Players::Computer:0x000000011eb738 @token="O">
      #<Game:0x000000011eb620 @player_1=#<Players::Human:0x000000011eb788 @token="X">, @player_2=#<Players::Computer:0x000000011eb738 @token="O">>
      @board = board
      #<Board:0x000000011eb710 @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]>
    end


    def play
      until over?
        turn
      end
      if won?
        board.display
        puts "Congratulations #{winner}!"
      elsif draw?
        board.display
        puts "Cats Game!"
      end
    end

    def current_player
      #self is the game object, and the current_player instance method is looking against the whole self --> board is calling the board object and also why you are able to run the board.turn_count method since youre calling the instance method on the board class (i.e we would have access to all the board methods).  This method looks to check the board to determine whose turn it is, knowing that X always goes first and therefore a divisor determines if it's player_1(X) or player_2(O) and then returns that object, denoted as X and O by the object's token
      if board.turn_count % 2 == 0
        self.player_1
      else
        self.player_2
      end
    end

    def over?
      if board.full? || won? || draw?
        true
      else
        false
      end
    end

    def won?
      WIN_COMBINATIONS.find do |win_combination|
        if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X"
          true
        elsif self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
          true
        else
          false
        end
      end
    end

    def draw?
      if board.full? && !won?
        true
      else won?
        false
      end
    end

    def winner
      if won?
        self.board.cells[won?[0]]
      else
        nil
      end
    end

    def turn
      puts "Please enter 1-9:"
      board.display
      input = self.current_player.move(self)
      if board.valid_move?(input)
        board.update(input, self.current_player)
      else
        turn
      end
    end




end

#  cd ~/code/labs/ttt-with-ai-project-v-000
