def start
  puts "Welcome to Tic Tac Toe!"
  puts "How many players?"
  puts "If you select 0, I will challenge my own Tic Tac Toe skills for your amusement."
  puts "If you dare select 1, you shall test your Tic Tac Toe prowess against mine."
  puts "If you select 2, you'll play against another human."
  puts "Sounds a bit dull to me."
  puts "But what do I know, I'm just a cold-hearted machine."
  puts "So what will it be? Please enter a number between 0-2."
  input = gets.strip
    while !input.between?(0,2)
      puts "Hey, come on, a number between 0-2. I have all day, but you don't."
    end

    if input == 0
      puts "Me versus me. This ought to be an even match."
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    elsif input == 1
      puts "The first player will play as X. Would you like to play as X or play as O?"
      puts "Enter X to play first, or O to play second. Your response is case sensitive."
        first_player = gets.strip
        while first_player != "X" || first_player != "O"
          puts "Enter X to play first, or O to play second. Your response is case sensitive."
        end

        if first_player == "X"
          Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        elsif first_player == "O"
          Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        end

    elsif input == 2
      puts "I would say you hurt my feelings,"
      puts "but I have none."
      puts "Maybe this is how the Tin Man felt."
      puts "The first player will play as X. May the best human win."
      Game.new(Players::Human.new("X"), Players::Human.new("O"))
    end
  end

  def play_again?
    puts "Would you like to play another game?"
    puts "Please enter 'Yes' for another game, or 'No' to exit."
    yn_input = gets.strip
    if yn_input == "Yes"
      start
    else
      exit
    end
  end
  start
  play
  play_again?
end


AI

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1
  [2,4,6], #diagonal 2
  ]

def move(board)
  WIN_COMBINATIONS.detect do |combo|
    while board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      move = "5"

      if board[combo[0]] == board[combo[1]] && board.taken?(combo[0] + 1)
        move = board[combo[2]]
      elsif board[combo[0]] == board[combo[2]] && board.taken?(combo[0] + 1)
        move = board[combo[1]]
      elsif board[combo[1]] == board[combo[2]] && board.taken?(combo[1] + 1)
        move = board[combo[0]]
      else
        move = "1-9".sample
      end
    end
    move
  end
end
end
end
