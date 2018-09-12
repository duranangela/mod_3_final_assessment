class ValidationService
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def root
    if response.status == 404
      'error message'
    else
      JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:inflectionOf][0][:text]
    end
  end

  def response
    conn.get("/api/v1/inflections/en/#{word}")
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['app_id'] = ENV['DICT_APP_ID']
      faraday.headers['app_key'] = ENV['DICT_APP_KEY']
    end
  end
end
