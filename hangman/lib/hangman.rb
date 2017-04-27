require('pry')
class Hangman
  @noose =  ["   ________________",
              "   |               |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "             ______|_____"]

  @hung =   ["   ________________"
              "  /\&               |",
              "  \&/               |",
              "  |                |",
              "-------            |",
              "  |                |",
              "  |                |",
              "  /\&               |",
              " /  \&              |",
              "             ______|_____"]

  define_method(:initialize) do
    @mistakes = 1
  end
  define_method(:draw) do
    drawn = []
    @hung.each_with_index() do |index|
      if index <= @mistakes
        drawn.push(@hung[index])
      end
    end
    @oose.each_with_index() do |index|
      if index > @mistakes
        drawn.push(@noose[index])
      end
    end
    drawn
  end
  define_method(:mistake) do
    @mistakes +=1
  end
end
