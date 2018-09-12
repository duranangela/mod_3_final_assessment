require 'rails_helper'

describe 'POST “/api/v1/games/1/plays"' do
  it 'user can post a play to the game' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    params = { user_id: 1, word: 'at' }

    post "/api/v1/games/1/plays", params: params
    result = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    expect(response.status).to eq(201)


  end



end
