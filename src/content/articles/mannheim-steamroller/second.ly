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
  \fixed c' {
    \clef treble
    \key f \major
    \time 12/8

    % SYNTH
    \partial 8 c8 \glissando |
    c'4.( c'4) bf8 a4. \appoggiatura { g16 a g a } g4. |
    f4. g4. a4. f4.( |
    f2.) g4 a8 bf4 g8 |
    a4.( a4) g8 \appoggiatura { f16 g } f4. ef4. |
    f1.( |
    \time 6/8 f4.) r4 c8 \glissando |

    \time 12/8 c'4.( c'4) bf8 a4. \appoggiatura { g16 a g a } g4. |
    f4. g4. a4. f4.( |
    f1. |
    f2.) g4 a8 bf4 g8 |
    a4.( a4) g8 \appoggiatura { f16 g } f4. ef4. |
    \time 6/8 f2.( |
    \time 12/8 f1.) |
    f,1. |

    \compressMMRests { R1.*4 } |

    % F. HORN
    c'4.( c'4) bf8 a4. g4. |
    f4. g4. a4. f4.( |
    f4.) r4. g4 a8 bf4 g8 |
    a4.( a4) g8 f4. ef4. |
    f1.( |
    \time 6/8 f4.) r4 c8 |

    \time 12/8 c'4.( c'4) bf8 a4. g4. |
    f4. g4. a4. f4.( |
    f1.) |
    r2. g4 a8 bf4 g8 |
    a4.( a4) g8 f4. ef4. |
    \time 6/8 f2.( |
    \time 12/8 f1.) |
    r1. |
    f2.( f4.) g4 e8 |
    f,1. |

    \compressMMRests { R1.*2 } |

    g4.( g4) a8 bf4. g4. |
    a4.( a4) bf8 c'4. a4. |
    a4 bf8 c'4. d'4 e'8 f'4. |
    e'4. d'4. c'2. |
    r1. |

    c'4.( c'4) bf8 a4. \appoggiatura { g16 a g a } g4. |
    f4. g4. a4. f4.( |
    f1 f4.) d8 \glissando |
    d'4 d'8 d'4 d'8 c'4.( c'4) bf8 |
    \time 6/8 a4. g4. |
    \time 12/8 f1.( |
    f1.)
    f1.( |
    f1.)
    f1.( |
    f1.)

    \compressMMRests { R1.*30 } |

    % STRINGS
    c'4.( c'4) bf8 a4. g4. |
    f4. g4. a4. f4.( |
    f2.) g4 a8 bf4 g8 |
    a4.( a4) g8 f4. ef4. |
    f1.( |
    \time 6/8 f4.) r4. |

    \time 12/8 c'4.( c'4 ) bf8 a4. g4. |
    f4. g4. a4. f4.( |
    f1.) |
    d'4 d'8 d'4 d'8 c'4.( c'4) bf8 |
    \time 6/8 a4. g4. |
    \time 12/8 f1.( |
    f1.) |
    f1.( |
    f1.) |
    f1.( |
    f1.) |
    f1.( |
    f1.) |
  }
>>
