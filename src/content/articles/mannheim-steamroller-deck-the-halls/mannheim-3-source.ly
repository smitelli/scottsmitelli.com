% lilypond --svg mannheim-3-source.ly

\version "2.22.2"
\language "english"

\layout {
  indent = 0.0
  \context {
    \Score
    \omit BarNumber
  }
}

\header {
  tagline = ##f
}

<<
  \chords {
    \set chordChanges = ##t

    c1 |
    f1 | f2 g2 |
    c4 b4:dim c2 | c1 |
  }

  \fixed c' {
    \tempo "Swing" 4 = 160

    \clef treble
    \key f \major
    \time 4/4 \numericTimeSignature

    g4. a8 bf4 g4 |
    a4. bf8 c'4 a4 |
    a8 bf8 c'4 d'8 e'8 f'4 |
    \appoggiatura { e'16 f' } e'4 \appoggiatura { d'16 e' } d'4 c'2 |
    r1 |
  }
>>
