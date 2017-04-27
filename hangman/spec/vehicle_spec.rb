# require('rspec')
# require('word')
#
# describe('Word') do
# #   before() do
# #     Word.clear()
# #   end
#
#   describe("#initilize") do
#     it("makes a word instance") do
#       test_word = Word.new("word")
#       expect(test_word.word()).to(eq("word"))
#     end
#   end
#
#   describe("add_letter") do
#     it("adds successful letters to 'successful_letters'") do
#       test_word = Word.new("word")
#       test_word.add_letter("o")
#       test_word.add_letter("r")
#       expect(test_word.successful_letters()).to(eq("or"))
#     end
#     it("adds failed letters to 'failed_letters'") do
#       test_word = Word.new("word")
#       test_word.add_letter("x")
#       expect(test_word.failed_letters()).to(eq("x"))
#     end
#     it("returns words with unfound letters as blanks") do
#       test_word = Word.new("word")
#       test_word.add_letter("o")
#       expect(test_word.add_letter("r")).to(eq("_or_"))
#     end
#   end
# end
