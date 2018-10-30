class WordSearchFacade
  attr_reader :word, :sentances
  def initialize(word)
    @word = word
  end

  def sentances
    @sentances = SentanceSearch.new(@word).examples.map do |example|
      Sentance.new(example[:text])
    end
  end
end
