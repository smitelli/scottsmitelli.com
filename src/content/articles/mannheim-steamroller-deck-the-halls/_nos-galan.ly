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

global = {
  \key f \major
  \time 4/4 \numericTimeSignature
}

\parallelMusic chordProg,right,left {
  f1                                 |
  <c f a c'>4. <g bf>8 <f a>4 <e g>4 |
  f4         f,4       a,4    c4     |

  f1               |
  f4     f4 a4  f4 |
  <f a>4 a4 c'4 a4 |

  c2           f2               |
  g8 a8 bf8 g8 <f a>4.( <e g>8) |
  bf4   bf,4   c'4   c4         |

  f4      c4      f2      |
  <a, f>4 <g, e>4 <a, f>2 |
  f,4     f4      f,2     |

  f1                                 |
  <c f a c'>4. <g bf>8 <f a>4 <e g>4 |
  f4         f,4       a,4    c4     |

  f1               |
  f4     f4 a4  f4 |
  <f a>4 a4 c'4 a4 |

  c2           f2               |
  g8 a8 bf8 g8 <f a>4.( <e g>8) |
  bf4   bf,4   c'4   c4         |

  f4      c4      f2      |
  <a, f>4 <g, e>4 <a, f>2 |
  f,4     f4      f,2     |

  c1            |
  g4. a8 bf4 g4 |
  <c, e, g, c>1 |

  f2           c2     |
  a4. bf8      c'4 g4 |
  <f, a, c f>2 e4  c4 |

  f1                                |
  a16( bf16 c'4.)  bf16( c'16 d'4.) |
  f4           f4 f4             f4 |

  c4       g4      c2      |
  <c' e'>4 <b d'>4 <e c'>2 |
  g4       g,4     c2      |

  f1                                 |
  <c f a c'>4. <g bf>8 <f a>4 <e g>4 |
  f4         f,4       a,4    c4     |

  f1               |
  f4     f4 a4  f4 |
  <f a>4 a4 c'4 a4 |

  bf2           f2               |
  g8 d'8 bf8 g8 <f a>4.( <e g>8) |
  bf4    bf,4   c'4   c4         |

  f4      c4 f2      |
  <a, f>4 c4 <a, f>2 |
  f,4     f4 f,2     |
}

\score {
  \new PianoStaff <<
    \new ChordNames \chordProg
    \new Staff {
      \global \clef treble
      \fixed c' \right
    }
    \addlyrics {
      O mor gyn -- nes myn -- wes mein -- wen,
      fal lal lal lal lal_lal lal lal la.
      O mor fwyn yw llwyn meil -- lio -- nen,
      fal lal lal lal lal_lal lal lal la.
      O mor fel -- us yw'r cu -- san -- au,
      _ _ _ _ _
      Gy -- da serch a mwyn -- ion eir -- iau,
      fal lal lal lal lal_lal lal lal la.
    }
    \new Staff {
      \global \clef bass
      \fixed c \left
    }
  >>
}

