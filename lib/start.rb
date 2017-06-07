class Start
  def initialize
    num = nil
    puts "Welcome to Tic Tac Toe!"
    while num == nil do
      puts "\nHow many human players? (0-2)"
      num = gets.strip
      case num
      when "0"
        game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
      when "1"
        puts "Will human play X or O?"
        human_token = gets.strip
        case human_token
        when "x", "X"
          game = Game.new(Players::Human.new("X"),Players::Computer.new("O"))
        else
          game = Game.new(Players::Computer.new("X"),Players::Human.new("O"))
        end
      when "2"
        game = Game.new
      when "exit"
        break
      else
        puts "Invalid number."
        num = nil
      end
    end
    if !game.nil?
      game.play
    end
  end
end
