class Game

attr_accessor :player_1, :player_2, :board

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

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end

    def self.start
      player_num = nil
      while (player_num != "exit")
        puts "Welcome to Paul's Tic Tac Toe Game!"
        puts "What kind of game do you want to play?"
        puts "Select from options below:"
        puts "[0] AI vs. AI"
        puts "[1] One-Player (You vs. AI)"
        puts "[2] Two-Player (You vs. a friend (or a foe)!)"
        puts "Type 'exit' to leave!"
        puts "***Type 'wargames' for a special AI vs. AI fight! :)"
        player_num = gets.chomp
        case player_num
          when "0"
            player_1 = Players::Computer.new ("X")
            player_2 = Players::Computer.new ("O")
            self.new(player_1, player_2)
          when "1"
            puts "Who should go first (and be X)?"
            puts "[1] Computer AI"
            puts "[2] You"
            x_choice = gets.chomp
              if x_choice == "1"
                player_1 = Players::Computer.new("X")
                player_2 = Players::Human.new("O")
                self.new(player_1, player_2)
              elsif x_choice == "2"
                player_1 = Players::Human.new("X")
                player_2 = Players::Computer.new ("O")
                self.new(player_1, player_2)
              end
            when "2"
              puts "Who should go first (and be X)?"
              puts "[1] Player 1"
              puts "[2] Player 2"
              x_choice = gets.chomp
                if x_choice == "1"
                  player_1 = Players::Human.new("X")
                  player_2 = Players::Human.new("O")
                  self.new(player_1, player_2)
                elsif (x_choice == "2")
                  player_1 = Players::Human.new("O")
                  player_2 = Players::Human.new("X")
                  self.new(player_1, player_2)
                end
             when "wargames"
               x_count, o_count, cat_count = 0, 0, 0
               100.times do |game|
                 player_1 = Players::Computer.new ("X")
                 player_2 = Players::Computer.new ("O")
                 game = self.new(player_1, player_2)
                  if game.winner == "X"
                    x_count += 1
                  elsif game.winner == "O"
                    o_count += 1
                  elsif game.winner == nil
                    cat_count += 1
                  end
                end
                puts "X won #{x_count} times, O won #{o_count} times and it was a draw #{cat_count} times."
             when "exit"
               break
        end
      end
      puts "Thanks for playing!"
    end

    def current_player
      player = nil
      if @board.turn_count.odd?
        player = @player_2
      elsif @board.turn_count.even?
        player = @player_1
      end
      player
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        combo.all? {|play| @board.cells[play] == "X"} || combo.all? {|play| @board.cells[play] == "O"}
      end
    end

    def draw?
      @board.full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      winner = nil
      WIN_COMBINATIONS.each do |combo|
          winner = "X" if combo.all? {|play| @board.cells[play] == "X"}
          winner = "O" if combo.all? {|play| @board.cells[play] == "O"}
      end
      winner
    end

    def turn
      entry = current_player.move(@board)
      while(@board.valid_move?(entry) == false)
          puts "invalid"
          entry = current_player.move
      end
      @board.update(entry, current_player)
    end

    def play
      while !over?
        turn
        @board.display
        puts "\n"
      end
      case winner
        when "X"
          puts "Congratulations X!"
        when "O"
          puts "Congratulations O!"
        when nil
          puts "Cat's Game!"
      end

    end


end
