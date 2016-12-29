class WarGames < Game
  attr_accessor :games, :winners, :start_time, :end_time, :x_wins, :o_wins

  def initialize(player1, player2, board = Board.new)
    super
    @games = num_of_games
    @winners = []
  end

  def play
    self.start_time = Time.now

    eval("#{games}").times do
      board.reset!
      board.display
      turn until over?
      puts '', "Congratulations #{winner}!" if won?
      puts '', "Cat's Game!" if draw?
      winners << winner unless winner.nil?
    end

    self.end_time = Time.now
    wrap_up
  end

  def wrap_up
    winners_report
    sleep(1)
    play_again?
  end

  def num_of_games
    puts '', 'How many games do you want to run through?'
    gets.chomp.to_i
  end

  def winners_report
    count_winners
    puts '', "#{games} war games completed in " + (end_time - start_time).to_s.yellow + ' seconds.'
    puts "X won #{x_wins.to_f / games * 100}%".red + " of the time (#{x_wins} games)."
    puts "O won #{o_wins.to_f / games * 100}%".blue + " of the time (#{o_wins} games)."
    puts "Cat's game #{100 - (winners.size.to_f / games * 100)}%".green + " of the time (#{games - winners.size} games)."
  end

  def count_winners
    self.x_wins = winners.select { |winner| winner == 'X' }.size
    self.o_wins = winners.select { |winner| winner == 'O' }.size
  end
end