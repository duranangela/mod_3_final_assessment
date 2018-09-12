class GameInfoSerializer < ActiveModel::Serializer
  attibutes :game_id

  def game_id
    object.id
  end



end
