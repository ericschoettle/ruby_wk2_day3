class Word
  @@words = []

  define_method(:initialize) do
    @failed_letters = ""
    @successful_letters = ""
    @word = random(@@words)
  end

  define_method(:add_letter) do |letter|
    if (word.include?(letter))
      @successful_letters = @successful_letters + letter
      blanks = @word.tr("'^" + @successful_letters + "'", "_")
    else
      @mistakes += 1
      @failed_letters = @failed_letters + letter
    end
    blanks
  end
end
