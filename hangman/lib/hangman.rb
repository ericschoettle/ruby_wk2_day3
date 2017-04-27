require('pry')
class Hangman
  @@noose =  ["   ________________",
              "   |               |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "                   |",
              "             ______|_____"]

  @@hung =   ["   ________________",
              "  /\\               |",
              "  \\/               |",
              "  |                |",
              "-------            |",
              "  |                |",
              "  |                |",
              "  /\\               |",
              " /  \\              |",
              "             ______|_____"]
  @@words = ["these", "words", "are" "tests"]

  define_method(:initialize) do |word = @@words[rand(@@words.length())]|
    @mistakes = 0
    @failed_letters = ""
    @successful_letters = ""
    @word = word
  end

  define_method(:draw) do
    drawn = []
    @@hung.each_with_index() do |d, index|
      if index <= @mistakes
        drawn.push(@@hung[index])
      end
    end
    @@noose.each_with_index() do |d, index|
      if index > @mistakes
        drawn.push(@@noose[index])
      end
    end
    drawn
  end

  define_method(:mistake) do
    @mistakes +=1
  end

  define_method(:word) do
    @word
  end

  define_method(:failed_letters) do
    @failed_letters
  end

  define_method(:successful_letters) do
    @successful_letters
  end

  define_method(:add_letter) do |letter|
    if (word.include?(letter))
      @successful_letters = @successful_letters + letter
    else
      @mistakes += 1
      @failed_letters = @failed_letters + letter
    end
    blanks = @word.tr("^'(" + @successful_letters + ")'", "_")
  end

  # define_singleton_method(:clear) do
  #   @@hangmen = 0
  # end
end
