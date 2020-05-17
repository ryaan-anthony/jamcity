module Jamcity
  class Notes
    def mapping
      {
        'C': {
          notes: %w[00 0C 18 24 30 3C 48 54 60 6C 78],
          scales: %w[maj min blu myx dor pen dim]
        },
        'C#': {
          notes: %w[01 0D 19 25 31 3D 49 55 61 6D 79],
          scales: %w[]
        },
        'D': {
          notes: %w[02 0E 1A 26 32 3E 4A 56 62 6E 7A],
          scales: %w[maj min myx dor pen dim]
        },
        'D#': {
          notes: %w[03 0F 1B 27 33 3F 4B 57 63 6F 7B],
          scales: %w[min blu dor]
        },
        'E': {
          notes: %w[04 10 1C 28 34 40 4C 58 64 70 7C],
          scales: %w[maj myx pen dim]
        },
        'F': {
          notes: %w[05 11 1D 29 35 41 4D 59 65 71 7D],
          scales: %w[maj min blu myx dor]
        },
        'F#': {
          notes: %w[06 12 1E 2A 36 42 4E 5A 66 72 7E],
          scales: %w[blu dim]
        },
        'G': {
          notes: %w[07 13 1F 2B 37 43 4F 5B 67 73 7F],
          scales: %w[maj min blu myx dor pen]
        },
        'G#': {
          notes: %w[08 14 20 2C 38 44 50 5C 68 74],
          scales: %w[min blu dim]
        },
        'A': {
          notes: %w[09 15 21 2D 39 45 51 5D 69 75],
          scales: %w[maj myx dor pen]
        },
        'A#': {
          notes: %w[0A 16 22 2E 3A 46 52 5E 6A 76],
          scales: %w[min blu myx dor dim]
        },
        'B': {
          notes: %w[0B 17 23 2F 3B 47 53 5F 6B 77],
          scales: %w[maj pen]
        }
      }
    end

    def scales
      {
        maj: 'Major',
        min: 'Minor',
        blu: 'Blues',
        myx: 'Myxolydian',
        dor: 'Dorian',
        pen: 'Pentatonic',
        dim: 'Diminished',
      }
    end
  end
end