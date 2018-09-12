class ValidationPresenter
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def root
    JSON.parse(response.body, symbolize_names: true)[:results][:lexicalEntries][:inflectionOf][:text]
  end

  def response
    conn.get do |req|
      req.headers(headers)
    end
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{word}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def headers
    {
      app_id: ENV['DICT_APP_ID'],
      app_key: ENV['DICT_APP_KEY']
    }
  end

end
