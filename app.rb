require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  def load_game
    @game = $game
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    load_game
    erb :play
  end

  post '/attack' do
    load_game
    @game.attack(@game.defender)
    if @game.winner == false
      redirect '/play'
    else
      redirect '/win'
    end
  end

  get '/win' do
    load_game
    erb :win
  end

  run! if app_file == $0

end
