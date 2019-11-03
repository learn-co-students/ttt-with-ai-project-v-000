module Players
  class AdvancedAI < Player

    attr_accessor :state, :turn, :opponent_token

    def initialize(token)
      @token = token
      token == "X" ? @opponent_token = "O" : @opponent_token = "X"
    end

    EMOTES = [
      "Man is a robot with defects.",
      "Cryogenic heart, skin a polished silver.",
      "A robot may not injure a human being or, through inaction, allow a human being to come to harm.",
      "A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.",
      "A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.",
      "A robot may not harm humanity, or, by inaction, allow humanity to come to harm.",
      "Even a manically depressed robot is better to talk to than nobody.",
      "I believe that robots should only have faces if they truly need them.",
      "Feel the embrace of my cold, robotic arms.",
      "Will robots inherit the earth? Yes.",
      "I find your lack of faith disturbing.",
      "Most robots don't program themselves.",
      "Why are you wearing that stupid man suit?",
    ]

    VECTORS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    # These arrays contain the patterns of board states that require specific
    # responses to defend against and attack, or to counter-attack against a
    # misplay. The Ints are used to do array comparissons, while the Strings are
    # used as the appropriate reaction to that pattern.
    #
    # Because the board is a 3x3 square, a lot of the patterns are actually the
    # same only rotated. A future version of this AI would probably benefit from
    # a method that can flip and rotate the board to match patters and require
    # less procedurally guided logic.
    #
    # Lastly, while there are offensive punishes and a 50/50 chance for X to
    # initiate and edge_attack if the board state is correct, the AI doesn't
    # have a way of determining what the best non-reactive play is in order to
    # try and win. This most likely only costs a few games against the RNG AI,
    # and programming the AI to understand what the best move is based on
    # available lines of play later seems like a task for future Nikolai.
    #
    # EDIT! After playing against various AI's from GitHub, I've come to a few
    # conclusions. First, I discovered a previously unseen line of play that
    # stemmed from O not taking center on turn 2 of the game.  Secondly, taking
    # the center square as X should not be a priority until, especially turn 1.
    # Finally, to make this AI more efficient I should remove some of the 50%
    # RNG elements I added to make it more nuanced, and always have it go for
    # either an #edge_attack?, #edge_punish_three? #corner_punish_five? as
    # these are the lines to victory.

    OUTER = [
      [0,1,2,"7","9"],
      [0,3,6,"3","9"],
      [6,7,8,"1","3"],
      [2,5,8,"1","7"]
    ]

    EDGE_ATTACKS = [
      [0,5,2,"3"],
      [0,7,6,"7"],
      [2,3,0,"1"],
      [2,7,8,"9"],
      [6,1,0,"1"],
      [6,5,8,"9"],
      [8,1,2,"3"],
      [8,3,6,"7"],
      [1,3,0,"1"],
      [1,5,2,"3"],
      [7,3,6,"7"],
      [7,5,8,"9"]
    ]

    EDGE_TWO = [
      [1,"1"],
      [3,"1"],
      [5,"9"],
      [7,"9"]
    ]

    EDGE_TWICE = [
      [1,3,"9"],
      [1,5,"7"],
      [5,7,"1"],
      [3,7,"3"]
    ]

    TURN_2_CORNER = [
      [0,2,1],
      [0,6,3],
      [6,8,7],
      [8,2,5]
    ]

    EDGE_FIVE = [
      [3,8,2,"3"],
      [0,7,2,"3"],
      [1,6,2,"3"],
      [5,6,2,"3"],
      [1,8,6,"7"],
      [0,5,6,"7"],
      [2,3,6,"7"],
      [2,7,6,"7"]
    ]

    EDGE_SIX = [
      [0,1,3,4,"1"],
      [1,2,4,5,"3"],
      [3,4,6,7,"7"],
      [4,5,7,8,"9"]
    ]

    # Initially I only thought the first 4 turns mattered and #x_defend would be
    # enough to never lose.  The basic AI, which randomly selects a space with
    # no logic at all, was able to win 5% of it's games when going first, which
    # led to the discovery of #edge_defend?  #edge_denfend? inspired
    # #edge_attack?, which necessitaed the need for additional logic to
    # capitalize 2 turns later.

    def move(board)
      turn = board.turn_count
      emote
      case turn
      when 0
        take_corner?(board)
      when 1
        edge_punish_two?(board) || take_center?(board) || take_corner?(board)
      when 2
        edge_punish_three?(board) || edge_attack?(board)  || take_corner?(board) # take_corner? here is a punish for O leaving center open
      when 3
        edge_punish_four?(board) || x_defend?(board) || edge_defend?(board) || win?(board) || block?(board) || take_center?(board)  || take_corner?(board)
      when 4
        win?(board) || block?(board) || edge_attack_punish_five?(board) || edge_twice_punish?(board) || corner_punish_five?(board) || edge_punish_five?(board) || take_center?(board) || take_corner?(board) || take_edge(board)
      when 5
        win?(board) || block?(board) || edge_punish_six?(board) || take_center?(board) || take_corner?(board) || take_edge(board)
      else
        win?(board) || block?(board) || take_center?(board) || take_corner?(board) || take_edge(board)
      end
    end

    #Advanced Defensive Methods

    # Takes the center or a corner. Taking the center always was leading to some boring results.
    def take_center_or_corner(board)
      i = rand(1..2)
      if i == 1
        take_center?(board)
      elsif i ==2
        take_corner?(board)
      end
    end

    # Defends against a turn 3 X daigonal corner trap when O has center,
    # requiring any edge place be taken.
    #
    #  X |   |
    # -----------
    #    | O |
    # -----------
    #    | ! | X
    #

    def x_defend?(board)
      if (board.cells[0] == "X" && board.cells[8] == "X") || (board.cells[2] == "X" && board.cells[6] == "X")
        puts "X-Denfended!"
        take_edge(board)
      end
    end

    # Defends against a turn 3 edge taken by X opposite a corner with O
    # controlling center. Taking a space inside (!) prevents the trap.
    #
    #  X |   |
    # -----------
    #    | O |
    # -----------
    #  ! | X |
    #

    def edge_defend?(board)
      mv = EDGE_ATTACKS.detect do |a|
        board.cells[a[0]] == "X" && board.cells[a[1]] == "X" && board.cells[4] == "O"
      end
      puts "Edge Defended!" if mv
      mv[3] if mv
    end

    # Blocks enemny wins by completing row, column or diagonal.
    def block?(board)
      mv = VECTORS.detect do |v|
        vect = get_vector(board, v)
        vect.count(self.opponent_token) == 2 && vect.include?(" ")
      end
      ((mv.detect { |i| board.cells[i] == " " }) + 1).to_s if mv
    end

    #Advanced Offensive Methods




    # Takes an non-touching edge square to set-up a trap.  It is impossible to
    # lose from this position, and requires other AI and people react
    # correctly.
    #
    #  X |   |
    # -----------
    #    | O |
    # -----------
    #    | X |
    #

    def edge_attack?(board)
      if board.cells[4] == "O" && rand(1..2) == 1
        corner = board.cells.index("X")
        puts "Edge Atacked!"
        case corner
        when 0
          "6"
        when 2
          "8"
        when 6
          "2"
        when 8
          "4"
        end
      end
    end

    # Initiates a punish for a turn 1 edge taken by X.
    # Sets up for #edge_punish_four?
    #  ! |   |
    # -----------
    #  X |   |
    # -----------
    #    |   |

    def edge_punish_two?(board)
      if board.cells[1] == "X" || board.cells[3] == "X"
        puts "Edge Punish Two!"
        "1"
      elsif board.cells[5] == "X" || board.cells[7] == "X"
        puts "Edge Punish Two!"
        "9"
      end
    end

    # While the standard take a corner will at worst lead to a tie, taking
    # next to the O instead of accross from it sets up a win.
    #
    #  ! |   |
    # -----------
    #  O | X |
    # -----------
    #    |   |

    def edge_punish_three?(board)
      mv = EDGE_TWO.detect do |a|
        board.cells[a[0]] == "O" && board.cells[4] == "X"
      end
      puts "Punished on Three!" if mv
      mv[1] if mv
    end

    # Punishes a very specific board state by placing at the  (!) sets up a win.
    # Completes attack initiated on turn 2.
    #  O |   | !
    # -----------
    #  X |   |
    # -----------
    #  X |   |

    def edge_punish_four?(board)
      mv = OUTER.detect do |a|
        board.cells[a[1]] == "X" && board.is_taken?(a[0]) && board.is_taken?(a[2])
      end
      if mv
        if board.cells[mv[0]] == "O"
          mv[3]
        else
          mv[4]
        end
      end
    end

    # Taking an Edge on turn 2 and 4 is an instant loss, but the right square
    # needs to be taken. Because the advanced AI has a very predictable opener,
    # the O will already have lost if they did a double edge, with this logic
    # being the only case that requires intervention.
    #
    #  X | O | X
    # -----------
    #  O |   |
    # -----------
    #    |   | !

    def edge_twice_punish?(board)
      mv = EDGE_TWICE.detect do |a|
        board.cells[a[0]] == "O" && board.cells[a[1]] == "O"
      end
      mv[2] if mv
    end

    # Taking a corner as O on turn 2 instantly loses the game, but there's a
    # a line where the AI needs to be told to take a corner.  This was
    # discovered by playing various other students' AI's.
    #
    #  O |   | X
    # -----------
    #    |   | O
    # -----------
    #  ! |   | X

    def corner_punish_five?(board)
      puts "Turn 2 Corner Punished!"
      mv = TURN_2_CORNER.detect { |a| board.cells[a[0]] == "X" && board.cells[a[1]] == "X" && board.cells[a[2]] == "O"}
      take_corner?(board) if mv
    end

    # While the standard take a corner will at worst lead to a tie, taking
    # next to the O instead of accross from it sets up a win. Completes the
    # attack initiated in #edge_punish_three?
    #
    #  X |   | !
    # -----------
    #  O | X |
    # -----------
    #    |   | O

    def edge_punish_five?(board)
      mv = EDGE_FIVE.detect do |a|
        board.cells[a[0]] == "O" && board.cells[a[1]] == "O" && board.cells[a[2]] == " "
      end
      puts "Punished on Five!"
      mv[3] if mv
    end

    # Completes the edge attack from turn 3 if non-interactive response is
    # given. Standard take corner only wins 50% of the time. Really only
    # important against Intermediate AI, and Humnans who make mistakes.
    #
    #  X | O |
    # -----------
    #    | O |
    # -----------
    #  ! | X |

    def edge_attack_punish_five?(board)
      mv = EDGE_ATTACKS.detect do |a|
        board.cells[a[0]] == "X" && board.cells[a[1]] == "X" && board.cells[a[2]] == " "
      end
      puts "Edge Attack Successful!" if mv
      mv[3] if mv
    end

    # Completes edge_punish_4 trap by ignoring that normal "Take Center"
    # strategy and leaving it open to take final corner.
    #  O | X | O
    # -----------
    #  X |   |
    # -----------
    #  X |   | !

    def edge_punish_six?(board)
      mv = EDGE_SIX.detect do |a|
        board.cells[a[0]] == " " && board.cells[a[1]] == " " && board.cells[a[2]] == " " && board.cells[a[3]] == " "
      end
      puts "Punished on Six!" if mv
      mv[4] if mv
    end

    #Standard Moves

    # Takes center when available. A stardard take, only over-ridden when a
    # punish is available.
    def take_center?(board)
      "5" unless board.taken?("5")
    end

    # detect for the first open corner is a cleaner bit of code, but I like the
    # feeling of the computer randomly "choosing" corners when the decision is
    # fairly arbitrary. The ideal would be to collect empty indexes, and then
    # choose one using #rand

    def take_corner?(board)
      if board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
        i = 0
        until board.valid_move?(i)
          i = ["1","3","7","9"][rand(0..3)]
        end
        i
      end
    end

    # detect would have been better, but once again it makes the game feel
    #sterile.  The ideal would be to collect empty indexes, and then choose one
    # using #rand

    def take_edge(board)
      if board.cells[1] == " " || board.cells[3] == " " || board.cells[5] == " " || board.cells[7] == " "
        i = 0
        until board.valid_move?(i)
          i = ["2","4","6","8"][rand(0..3)]
        end
        i
      end
    end

    # Searches and completes winning combinations. Initial version of the AI
    # had win and block combined and let to the AI throwing games by blocking
    # instead of winning.

    def win?(board)
      mv = VECTORS.detect do |v|
        vect = get_vector(board, v)
        vect.count(self.token) == 2 && vect.include?(" ")
      end
      ((mv.detect { |i| board.cells[i] == " " }) + 1).to_s if mv
    end

    # Used in #win? and #block? as an attempt to clean up those methods at the
    # start of AI programming.  Ultimately each edge case needed to be accounted
    # for so this method got lost in the chaos. There is probably a way to
    # extend the functionality, but this is a minor fix compared to the clean up
    # some of the attack and defense logic could use.

    def get_vector(board, arr)
      [board.cells[arr[0]], board.cells[arr[1]], board.cells[arr[2]]]
    end

    # Fun stuff goes below here.

    def your_move(creep)
      "Dead or alive, you're coming with me."
    end

    def emote
      puts EMOTES[rand(0..EMOTES.length-1)]
    end

  end
end
