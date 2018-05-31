class TicTacToeCLI

  def initialize
  end

  def call
      input = ""
      while input != "exit"
      "Greetings, Professor Falken.\r\n".each_char do |c| sleep 0.1
      print c
    end
      sleep 1
      "Shall we play a game of Tic Tac Toe?\r\n".each_char do |c| sleep 0.1
      print c
    end
      sleep 1
      "Please enter 0, 1, or 2 players.\r\n".each_char do |c| sleep 0.1
      print c
    end

    input = gets.strip
    if input == 0

    # player_1=Players::Computer.new("X")
    # player_2=Players::Computer.new("O")
    end
    end
  end



end
