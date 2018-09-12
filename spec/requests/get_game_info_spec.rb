require 'rails_helper'

describe "GET '/api/v1/games/1'" do
  context 'with an existing game' do
    it 'returns basic game info' do
      josh = User.create(id: 1, name: "Josh")
      sal = User.create(id: 2, name: "Sal")

      game = Game.create(player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      get '/api/v1/games/1'

      result = JSON.parse(response.body, symbolize_names: true)
      binding.pry

      expect(response).to be_success
      expect(result[:game_id]).to eq(1)
      expect(result[:scores][0][:user_id]).to eq(1)
      expect(result[:scores][0][:score]).to eq(15)
      expect(result[:scores][1][:user_id]).to eq(2)
      expect(result[:scores][1][:score]).to eq(16)
    end
  end
end
