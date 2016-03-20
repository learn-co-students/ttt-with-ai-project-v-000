Notes

Board is going to take on behavior of GameState.. some changes made so far are not actually what I'm looking for.

GameTree will be a separate class that gets loaded into the Board class (board = gamestate remember)

...

...

GameTree does what?
  -> Returns an object with a collection of objects that feature all possible moves (node tree)
  -> There is no state, just copies of possible boards.

GameState...
  We can divide up responsibilities here. Some belong to the AI... 

 ***  @game_state = @board in my example ... so we need to update the @board to a specific BOARD OBJECT in the moves array after each turn is taken.

 *** Computer could probably handle the rank stuff, it takes the board as an optional argument.

 *** Likewise, the Human player ^^^

>>>>> RANK STUFF should go into the Computer class, and the Game class should update @board to the @board in Game returned by the Player (human/robot) before executing the loop again.


MOVE IT INTO THE PLAYER MOVE METHOD
  -> Move method returns the new @board object.
