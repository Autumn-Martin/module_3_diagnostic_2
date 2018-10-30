class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [
      {
        "user_id":1,
        "score":15
      },
      {
        "user_id":2,
        "score":16
      }
    ]
  end
end
