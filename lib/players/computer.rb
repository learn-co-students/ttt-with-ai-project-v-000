module Players
  class Computer < Player
    #attr_accessor :game
    @close = [1,2]
    @@win_combos = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    def move(board)
      p = board.cells


    #  @@win_combos.each do |n|
    #    n.detect do |i|
    #      if n.count{|i| p[i] == "X"} == 2
    #        close << i
    #        puts close
    #      elsif n.count {|i| p[i] == "O"} == 2
    #        close << i
    #        puts close
    #      end
    #    end
    #  end
    @@win_combos.each do |n|
      test = n.select! do |i|
        (n.count{|i| p[i] == "X"} == 2) || (n.count {|i| p[i] == "O"} == 2)
      end
      puts test
    end


    sleep(1)
    if test != false
      puts "howdy"
      puts @close.flatten.sample
    else
      (1 + rand(9)).to_s
    end

      #@@win_combos.each do |n|
      #  if n.count{|i| p[i] == "X"} == 2
      #    puts "There are two X's"
      #  elsif n.count {|i| p[i] == "O"} == 2
      #    puts "There are two O's"
      #  end
      #  (1 + rand(9)).to_s
      #end



      #p[4] = 4
      #p[0], [2], [6], and [8] = 3
      #p[1],[3],[5],[7] = 2

      #combos = Game::WIN_COMBINATIONS
      #if combos.any?

    end
  end
end
