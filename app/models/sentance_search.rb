class SentanceSearch
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def examples
    service.all_word_data[:results][0][:lexicalEntries][0][:entries][0][:senses][0][:examples]
  end

  private
  def service
    DictionaryService.new(@word)
  end
end
