class WarGames
  attr_accessor :game

  def initialize
    @game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))

    class << self.game
      def play
        @winners = []
        @time = Time.now
        100.times do
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
        puts ''
        play_again?
      end

      def winners_report
        x_wins = @winners.select { |winner| winner == 'X' }.size
        o_wins = @winners.select { |winner| winner == 'O' }.size
        puts ''
        puts 'War games completed in ' + (@time2 - @time).to_s.yellow + ' seconds.'
        puts "X won #{x_wins.to_f / 1.0}%".red + " of the time (#{x_wins} times)."
        puts "O won #{o_wins.to_f / 1.0}%".blue + " of the time (#{o_wins} times)."
        puts "Cat's game " + "#{100 - @winners.size.to_f}%".yellow + " of the time."

      end
    end
  end
end