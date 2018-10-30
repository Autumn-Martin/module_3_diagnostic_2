class DictionaryService
  def initialize(word)
    @word = word
  end

  def all_word_data
    get_json("api/v1/entries/en/#{@word}")
  end


  private

  def get_json(uri)
    JSON.parse(conn.get(uri).body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_key"] = ENV["app_key"]
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.adapter Faraday.default_adapter
    end
  end
end
