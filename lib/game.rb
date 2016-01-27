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
    [6,4,2]
  ]


  def initialize(player1 = Player.new("X"), player2 = Player.new("O", board = board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

    def current_player
      if @board.turn_count%2 == 0
        @player1
      else
        @player2
      end
    end


    def over?
      if @board.full?
        true
      else
        false
      end
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if combo.all?{|cell| cell== "X"}|| combo.all?{|cell| cell== "X"}
        else
          false
        end
    end

      def draw?
        if self.over? && self.won? == false
      end

      def winner
        if self.won?
          self.current_player
        elsif self.over?
          nil
        end
      end

      def move(location,player = "X")
        @board[location.to_i-1] = player
      end

      def turn
        while self.over? == false
          puts "Please enter 1-9:"
          input = gets.chomp
          if valid_move?(input)
            move(input.to_i, self.current_player)
            board.turn_count += 1
          else
            puts "The number you entered is not valid"
            self.turn
          end
        end
      end

end