% lilypond --png first.ly

\version "2.22.2"
\language "english"

\layout {
  indent = 0.0
  \context {
    \Score
    \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
    \omit BarNumber
  }
}

<<
  \chords {
    \set chordChanges = ##t

    % https://musescore.com/user/27997005/scores/5347261
    % f1 | d4:m c4 f2 | bf2 f2 | f4 c4:7 f2 |
    % f1 | d4:m c4 f2 | bf2 f2 | f4 c4:7 f2 |
    % c1 | f1 | f2 g2:m7 | c4 g4:7 c2:7 |
    % f1 | d4:m c4 f2 | bf2 f2 | f4 c4:7 f2 |

    % standalone gif
    % f1 | f1 | c2 f2 | f4 c4 f2 |
    % f1 | f1 | c2 f2 | f4 c4 f2 |
    % c1:7 | f2 c2 | f1 | c4 g4 c2 |
    % f1 | f1 | bf2 f2 | f4 c4 f2 |

    % https://www.christmasmusicsongs.com/deck-the-halls-sheet-music.html
    f2. c4:7 | d4:m c4 f2 | c2:7 f2 | f4 c4 f2 |
    f2. c4:7 | d4:m c4 f2 | c2:7 f2 | f4 c4 f2 |
    c2 c2:7 | f2. c4 | f2 d2:m | c4 g4:7 c2 |
    f2. c4 | d4:m c4 f2 | bf2 f2 | f4 c4:7 f2 |
  }
  \fixed c' {
    \clef treble
    \key f \major
    \time 4/4 \numericTimeSignature
    c'4. bf8 a4 g4 | f4 g4 a4 f4 | g8 a8 bf8 g8 a4. g8 | f4 e4 f2 |
    c'4. bf8 a4 g4 | f4 g4 a4 f4 | g8 a8 bf8 g8 a4. g8 | f4 e4 f2 |
    g4. a8 bf4 g4 | a4. bf8 c'4 g4 | a8 b8 c'4 d'8 e'8 f'4 | e'4 d'4 c'2 |
    c'4. bf8 a4 g4 | f4 g4 a4 f4 | d'8 d'8 d'8 d'8 c'4. bf8 | a4 g4 f2 |

  }
  \addlyrics {
    Deck the halls with boughs of hol -- ly, Fa la la la la la la la la,
    'Tis the sea -- son to be jol -- ly, Fa la la la la la la la la,
    Don we now our gay ap -- pa -- rel, Fa la la la la la la la la,
    Troll the an -- cient Yule -- tide car -- ol, Fa la la la la la la la la.
  }
>>
