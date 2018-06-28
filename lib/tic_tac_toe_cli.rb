class TicTacToeCLI
  attr_accessor :game

  def initialize
    prompt
    @game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  end

  def prompt
    puts "｡*.⋆✧˚ ░W░E░L░C░O░M░E░ 𝕥𝕠 𝕋𝕀ℂ-𝕋𝔸ℂ-𝕋𝕆𝔼 ｡*.⋆✧˚\n
    Please make your selection as follows:\n
      ⭑ Enter 0 for AI Mode (Machine vs. Machine)\n
      ⭑ Enter 1 for 1-Player Mode (Human vs. Machine)\n
      ⭑ Enter 2 for 2-Player Mode (Human vs. Human)\n
      ⭑ Enter 'q' to quit"
  end

  def call
    input = gets.strip
    while input != "0" || input != "1" || input != "2" || input != "q" && @game.over? != true

      if input == "q"
        break
      elsif input == "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
        game.board.display
        game.play
      elsif input == "1"
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
        game.board.display
        game.play
      elsif input == "2"
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
        game.board.display
        game.play
      else
        puts "To begin a game, you must first select a mode. \n
              Please enter 0, 1, 2, or 'q'."
        input = gets.strip
      end
    end
  end
end
