% lilypond --svg mannheim-1-source.ly

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

    \partial 8 f8 |
    f1*2 |
    ef1 | ef2 bf2 |
    bf1 | bf4 c4 |
  }

  \fixed c' {
    \tempo "Swing" 4 = 160

    \clef treble
    \key f \major
    \time 4/4 \numericTimeSignature

    \partial 8 c8 \glissando |
    c'4. bf8 a4 \appoggiatura { g16 a g a } g4 |
    f4 g4 a4 f4( |
    f2) g8 a8 bf8 g8 |
    a4. g8 \appoggiatura { f16 g } f4 ef4 |
    f1( |
    \time 2/4 f4) r4 |
  }
>>
