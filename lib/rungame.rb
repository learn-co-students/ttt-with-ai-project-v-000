# class Rungame
#
#   def initialize
#     #maybe some data to be passed in.
#   end
#
#   def valid_choice?(input)
#     if input == "1 Player" || input == "2 Player"
#       true
#     else
#       false
#     end
#   end
#
#   def call
#     puts "Welcome"
#     counter = 0
#     counter += 1
#     puts "What kind of game is this? Please type: '1 Player' or '2 Player'"
#
#     input = gets.strip
#
#
#     if valid_choice?(input)
#       "game commence"
#     elsif counter == 5
#       puts "It seems like you have failed to enter a choice"
#       ####EXIT####
#     else
#       puts "Please enter a valid choice like '1 Player' or '2 Player'"
#       self.call # I want to start again from line: 10
#     end
#
#   end
#
#
# end
