class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    object.plays.first[:score] #=> iterate over scores & sum total for each user_id (if play[:user_id] == object.player_1_id)
    # binding.pry
    [
      {
        "user_id": object.player_1_id,
        "score":15
      },
      {
        "user_id": object.player_2_id,
        "score":16
      }
    ]
  end

end
