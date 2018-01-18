# I am an AI. This is how I should play Tic Tac Toe.

```
There are 3 distinctive positions on the board:

1. The center position (5)
2. A corner (1) (3) (7) (9)
3. A side position (2) (4) (6) (8)

If it's my move first(I am player 1 and my token is X):


  First move:

  I should always choose (1) as my first move.

  _X_|___|___
  ___|___|___
  ___|___|___

  If the opponent doesn’t choose the middle, I am guaranteed to win.

    Second move:

    If opponent chose (5) then choose corner (9).

    _X_|___|___
    ___|_O_|___
    ___|___|_X_

    If opponent chose (2) or (3) or, then choose corner (7).

    Opponent chose 2: 

    _X_|_O_|___
    ___|___|___
    _X_|___|___

        Third move:

        Opponent forced to choose (4), then choose (5).

        _X_|_O_|___
        _O_|_X_|___
        _X_|___|___

          Fourth move:

          Opponent forced to choose (3) or (9). If (3) choose (9), if (9) choose (3).

          _X_|_O_|_O_
          _O_|_X_|___       You win!!!
          _X_|___|_X_

          _X_|_O_|_X_
          _O_|_X_|___       You win!!!
          _X_|___|_O_


    Opponent chose 3:

    _X_|___|_O_
    ___|___|___
    _X_|___|___

      Third move:

      Opponent forced to choose (4), then choose (9).

      _X_|___|_O_
      _O_|___|___
      _X_|___|_X_

        Fourth move:

        Opponent forced to choose (5) or (8). If (5) choose (8), if (8) choose (5).

        _X_|___|_O_
        _O_|_O_|___       You win!!!
        _X_|_X_|_X_

        _X_|___|_O_
        _O_|_X_|___       You win!!!
        _X_|_O_|_X_



    If opponent chose (4) or (7), then choose corner (3).

    Opponent chose (4):

    _X_|___|_X_
    _O_|___|___
    ___|___|___

      Third move:

      Opponent forced to choose (2), then choose (5).

      _X_|_O_|_X_
      _O_|_X_|___
      ___|___|___

        Fourth move:

        Opponent forced to choose (7) or (9). If (7) choose (9), if (9) choose (7).

        _X_|_O_|_X_
        _O_|_X_|___
        _O_|___|_X_

        _X_|_O_|_X_
        _O_|_X_|___
        _X_|___|_O_

    Opponent chose (7):

    _X_|___|_X_
    ___|___|___
    _O_|___|___

      Third move:

      Opponent forced to choose (2), then choose (9).

      _X_|_O_|_X_
      ___|___|___
      _O_|___|_X_

        Fourth move:

        Opponent forced to choose (5) or (6). If (5) choose (6), if (6) choose (5).

        _X_|_O_|_X_
        ___|_O_|_X_
        _O_|___|_X_

        _X_|_O_|_X_
        ___|_X_|_O_
        _O_|___|_X_



    If opponent chose (5), then choose (9).

    _X_|___|___
    ___|_O_|___
    ___|___|_X_

If I move second:


    First move:

        Check if (5) is available, if it is, take it.

        If it isn’t take any corner.

    Second move:












Summary conditionals.

First - > 1
```
