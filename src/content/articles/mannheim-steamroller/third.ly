\version "2.22.2"
\language "english"

\layout {
  indent = 0.0
  \context {
    \Score
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

    R1*7 |
    ef1*11:5 |
    f1*6:5 |
    ef1:5 | ef2:5 bf2:5 |
    bf1:5 | bf4:5 c4 |
    f1*4:5 |
    ef1:5 | ef2:5 |
    bf1*2:5 |
    f1*6:5 |
    ef1:5 | ef2:5 bf2:5 |
    bf1:5 | bf4:5 c4 |
    f1*4:5 |
    ef1:5 | ef2:5 |
    bf1*2:5 |
    f1*4:5 |
    c1 |
    f1 | f2 g2 |
    c4 b4:dim c2 | c1 |
    f1*3:5 |
    bf2:5 c2 | c2 |
    ef1*2 |
    bf1*2 |
    f1*2:5 |
    R1*30 |
    f1*2:5 |
    ef1:5 | ef2:5 bf2:5 |
    bf1:5 |
    bf4:5 c4 |
    f1*3:5 |
    bf2:5 c2 | c2 |
    ef1*2 |
    bf1*2 |
    ef1*2 |

    bf1*2 |
    f1*2:5 |
  }
  \fixed c' {
    \tempo "Swing" 4 = 160

    \clef treble
    \key f \major
    \time 4/4 \numericTimeSignature

    \compressMMRests { R1*4 } |

    <f c'>4. <d bf>8 <f a>4 <c g>4 |
    <d f>4 <c g>4 <bf, a>4 <bf, f>4( |
    <bf, f>1) |

    R1*5 |

    <f c'>4. <d bf>8 <f a>4 <c g>4 |
    <d f>4 <c g>4 <bf, a>4 <bf, f>4( |
    <bf, f>1 |
    <bf, f>1) |

    R1*5

    % SYNTH
    r2 r4. c8 \glissando |
    c'4. bf8 a4 \appoggiatura { g16 a g a } g4 |
    f4 g4 a4 f4( |
    f2) g8 a8 bf8 g8 |
    a4. g8 \appoggiatura { f16 g } f4 ef4 |
    f1( |
    \time 2/4 f4) r8 c8 \glissando |

    \time 4/4 c'4. bf8 a4 \appoggiatura { g16 a g a } g4 |
    f4 g4 a4 f4( |
    f1) |
    r2 g8 a8 bf8 g8 |
    a4. g8 \appoggiatura { f16 g } f4 ef4 |
    \time 2/4 f2( |
    \time 4/4 f1) |
    f,1 |

    \compressMMRests { R1*4 } |

    % F. HORN
    c'4. bf8 a4 g4 |
    f4 g4 a4 f4( |
    f4) r4 g8 a8 bf8 g8 |
    a4. g8 f4 ef4 |
    f1 |
    \time 2/4 r2 |

    \time 4/4 c'4. bf8 a4 g4 |
    f4 g4 a4 f4( |
    f1) |
    r2 g8 a8 bf8 g8 |
    a4. g8 f4 ef4 |
    \time 2/4 f2( |
    \time 4/4 f1) |
    r1 |
    f2. g8 e8 |
    f,1 |

    \compressMMRests { R1*2 } |

    g4. a8 bf4 g4 |
    a4. bf8 c'4 a4 |
    a8 bf8 c'4 d'8 e'8 f'4 |
    \appoggiatura { e'16 f' } e'4 \appoggiatura { d'16 e' } d'4 c'2 |
    r1 |

    c'4. bf8 a4 \appoggiatura { g16 a g a } g4 |
    f4 g4 a4 f4( |
    f2.) r8 d8 \glissando |
    d'8 d'8 d'8 d'8 c'4. bf8 |
    \time 2/4 a4 \appoggiatura { g16 a } g4 |
    \time 4/4 f1( |
    f1) |
    f1( |
    f1) |
    f1( |
    f1) |

    \compressMMRests { R1*30 } |

    % STRINGS
    c'4. bf8 a4 g4 |
    f4 g4 a4 f4( |
    f2) g8 a8 bf8 g8 |
    a4. g8 f4 ef4 |
    f1( |
    \time 2/4 f4) r4 |

    \time 4/4 c'4. bf8 a4 g4 |
    f4 g4 a4 f4( |
    f1) |
    d'8 d'8 d'8 d'8 c'4. bf8 |
    \time 2/4 a4 g4 |
    \time 4/4 f1( |
    f1) |
    f1( |
    f1) |
    f1( |
    f1) |
    f1( |
    f1) |
    f'1( |
    f'1) |
  }
>>
