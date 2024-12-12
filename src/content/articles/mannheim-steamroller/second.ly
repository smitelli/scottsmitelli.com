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
  \fixed c' {
    \clef treble
    \key f \major
    \time 12/8
    c'4 bf8 a4 g4 %| f g a f | f g a bf g | a g f ef | f
    %c bf a g | f g a f | f | f | f g a bf g | a g f ef | f | f
  }
  \addlyrics {
    Deck the halls with boughs of hol -- ly, Fa la la la la la la la la,
    'Tis the sea -- son to be jol -- ly, Fa la la la la la la la la,
    Don we now our gay ap -- pa -- rel, Fa la la la la la la la la,
    Troll the an -- cient Yule -- tide car -- ol, Fa la la la la la la la la.
  }
>>
