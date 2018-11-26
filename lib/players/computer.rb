require 'pry'

module Players
  class Computer < Player
    # Goal -
    #Think about the levels of intelligence you can build into this method.
    #Start with the simplest level of intelligence, and get more and more complicated.

    # Problem -
    # my #move method from the Computer class is calling turn infinitly
    # whereas when I run the human vs human game it does not does not
    # put me in an infinit loop

    # Question -
    # How do I add 'intelligence' to the Computer's move method?
    
    # create a valid move
    def move(board)
      a = (1..10).to_a
      r = Random.new
      user_input = a.sample(random: r)
      puts "#{user_input}"
      #board.valid_move?(user_input)

      # board.cells[0] = 'X'
      # board.display
      # board.cells[1] = 'X'
      # board.display
      # board.cells[2] = 'X'
      # board.display
      # board.cells[3] = 'X'
      # board.display
      # board.cells[4] = 'X'
      # board.display
      # board.cells[5] = 'X'
      # board.display

    end
  end
end
