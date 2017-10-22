

class CLI

  def initialize
  end

  def start
    puts ""
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "How many players would you like in this game? ( 0 , 1 , or 2)"
    puts ""
    input = gets
    input_num = input.to_i
      if input.length > 2
        puts ""
        puts "That doesn't seem right.... let's start over."
        puts ""
        self.start

      elsif input_num == 0
        puts "No players it is!  Let's let the computer do the thinkin'!"

        game = Game.new(Players::Computer.new("X"), player_2 = Players::Computer.new("O"), Board.new)
        game.play

      elsif input_num == 1
        puts "Just by yourself :( that's fine.  Our computer friend will play with you.  You will be the first player."
        game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)

        game.board.display
        game.play

      elsif input_num == 2
        puts "Alright then... Do you want to be first or second (1 or 2)?"

        input2 = gets.to_i

        if input2 == 1
          game = Game.new(Players::Human.new("X"), Players::Human.new("O"),Board.new)

          game.board.display
          game.play


        elsif input2 == 2
          game = Game.new(Players::Human.new("O"), Players::Human.new("X"),Board.new)

          game.board.display
          game.play

        else
          "that doesn't seem right.... let's start over."
          self.start
        end
      else
        puts "That's not possible though!  Lets try again..."
        self.start
      end
  end

end
