class WordSearchFacade
  attr_reader :word, :sentances
  def initialize(word)
    @word = word
  end

  def sentance
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_key"] = ENV["app_key"]
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.adapter Faraday.default_adapter
    end

    sentance_data = JSON.parse(conn.get("api/v1/entries/en/#{@word}").body, symbolize_names: true)
    binding.pry
    sentance = sentance_data[:results][0][:lexicalEntries][0][:entries][0][:senses][0][:examples][0][:text]
  end
end
