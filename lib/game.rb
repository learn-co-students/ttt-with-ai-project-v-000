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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? { |spot| self.board.cells[spot] == self.board.cells[combo[0]] && self.board.taken?(spot + 1)}
    end
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    self.board.display
    puts "enter 1-9, #{self.current_player.token}"
    spot = self.current_player.move(self.board)
      if self.board.valid_move?(spot)
        self.board.update(spot, self.current_player)
      else
        puts "make a real move tho"
        self.turn
      end
    end

    def play
      until over?
        self.turn
      end
        if won?
          self.board.display
          puts "Congratulations #{self.winner}!"
        elsif draw?
          self.board.display
          puts "Cat's Game!"
        end
      end

      def start_game
        puts "Do you want to do a 0, 1, or 2 player game? Or wargames?"
        choice = gets.strip
        if choice == "0"
          game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
          game.play
        elsif choice == "1"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          game.play
        elsif choice == "2"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          game.play
        elsif choice == "wargames"
          @x_wins = []
          @y_wins = []
          100.times do
            game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
            game.play
            if self.winner == "X"
              @x_wins << self.winner
            elsif self.winner == "Y"
              @y_wins << self.winner
            end
          end
          puts "X won #{@x_wins.length} times"
          puts "Y won #{@y_wins.length} times"
        end
      end
end
