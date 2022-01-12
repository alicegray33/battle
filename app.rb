require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/player'

class Battle < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  def load_players
    @player_1 = $player_1
    @player_2 = $player_2
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    load_players
    erb :play
  end

  get '/attack' do
    load_players
    @player_2.reduce_hitpoints(Player::ATTACK_DAMAGE)
    
    erb :attack
  end

  run! if app_file == $0

end
