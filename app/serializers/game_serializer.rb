class GameSerializer < ActiveModel::Serializer
  attributes :game_id

  def game_id
    object.id
  end
end
