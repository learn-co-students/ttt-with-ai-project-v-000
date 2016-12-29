class WarGames
  attr_accessor :game, :games

  def initialize
    @game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))

    class << self.game
      def play
        @games = num_of_games
        @winners = []
        @time = Time.now
        eval("#{@games}").times do
          board.reset!
          board.display
          turn until over?
          puts '', "Congratulations #{winner}!" if won?
          puts '', "Cat's Game!" if draw?
          @winners << winner unless winner.nil?
        end
        @time2 = Time.now
        winners_report
        sleep(1)
        play_again?
      end

      def num_of_games
        puts '', 'How many games do you want to run through?'
        input = gets.chomp.to_i
      end

      def winners_report
        x_wins = @winners.select { |winner| winner == 'X' }.size
        o_wins = @winners.select { |winner| winner == 'O' }.size
        puts
        puts '', "#{@games} war games completed in " + (@time2 - @time).to_s.yellow + ' seconds.'
        puts "X won #{x_wins.to_f / @games * 100}%".red + " of the time (#{x_wins} games)."
        puts "O won #{o_wins.to_f / @games * 100}%".blue + " of the time (#{o_wins} games)."
        puts "Cat's game #{100 - (@winners.size.to_f / @games * 100)}%".green + " of the time (#{@games - @winners.size} games)."
      end
    end
  end
end