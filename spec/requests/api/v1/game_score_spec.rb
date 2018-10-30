# Background: This story assumes the base data from running `rake db:seed`
#
# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```
# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }
# ```

require 'rails_helper'

describe 'Games API' do
  it 'sends the game score' do
    josh = create(:user, id: 1)
    sal = create(:user, id: 2)
    game = create(:game, player_1_id: 1, player_2_id: 2)
    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    get "/api/v1/games/#{game.id}"

    game_score_info = JSON.parse(response.body, symbolize_names: true)

    expected_info = { "game_id": game.id,
                       "scores": [{ "user_id": 1,
                                    "score":15
                                  },
                                  {  "user_id": 2,
                                     "score":16
                                   }]
                    }
    expect(response).to be_successful
    expect(game_score_info).to eq(expected_info)
    expect(game_score_info).to have_key(:game_id)
    expect(game_score_info).to have_key(:scores)
  end
end
