require('rspec')
require('hangman')
require('word')

describe('hangman') do
  # before() do
  #   Hangman.clear()
  # end

  describe('#mistake') do
    it("increments the number of mistakes by 1") do
      test_hangman = Hangman.new("word")
      expect(test_hangman.mistake()).to(eq(1))
    end
  end

  describe('draw') do
    it("returns ASCII art of noose initially") do
      test_hangman = Hangman.new()
      expect(test_hangman.draw()).to(eq(
                 ["   ________________",
                  "   |               |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "             ______|_____"]))
    end
    it("returns ASCII art of head after two mistakes") do
      test_hangman = Hangman.new()
      test_hangman.mistake()
      test_hangman.mistake()
      expect(test_hangman.draw()).to(eq(
                 ["   ________________",
                  "  /\\               |",
                  "  \\/               |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "                   |",
                  "             ______|_____"]))
    end
  end

  describe("#initilize") do
    it("makes a word instance") do
      test_word = Hangman.new("word")
      expect(test_word.word()).to(eq("word"))
    end
  end

  describe("add_letter") do
    it("adds successful letters to 'successful_letters'") do
      test_word = Hangman.new("word")
      test_word.add_letter("o")
      test_word.add_letter("r")
      expect(test_word.successful_letters()).to(eq("or"))
    end
    it("adds failed letters to 'failed_letters'") do
      test_word = Hangman.new("word")
      test_word.add_letter("x")
      expect(test_word.failed_letters()).to(eq("x"))
    end
    it("returns words with unfound letters as blanks") do
      test_word = Hangman.new("word")
      test_word.add_letter("o")
      expect(test_word.add_letter("r")).to(eq("_or_"))
    end
  end
end
