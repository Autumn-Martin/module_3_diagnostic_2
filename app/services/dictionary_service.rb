class DictionaryService
  def initialize(word)
    @word = word
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_key"] = ENV["app_key"]
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def all_word_data
    JSON.parse(conn.get("api/v1/entries/en/#{@word}").body, symbolize_names: true)
    get_json("api/v1/entries/en/#{@word}")
  end

  def get_json(uri)
    JSON.parse(conn.get(uri).body, symbolize_names: true)
  end

end
