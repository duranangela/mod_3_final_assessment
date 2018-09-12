class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{
      "user_id" => object.player_1_id,
      "score" => score1
    },
    {
      "user_id" => object.player_2_id,
      "score" => score2
    }
    ]
  end

  def score1
    User.find(object.player_1_id).plays.sum(:score)
  end

  def score2
    User.find(object.player_2_id).plays.sum(:score)
  end
end
