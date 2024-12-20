% lilypond --svg mannheim-4-source.ly

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

    f1*3 |
    bf2 c2 | c2 |
    ef1*2 |
    bf1*2 |
    f1*2 |
  }

  \fixed c' {
    \tempo "Swing" 4 = 160

    \clef treble
    \key f \major
    \time 4/4 \numericTimeSignature

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
  }
>>
