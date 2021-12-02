require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
	enable :sessions
	
	configure :development do
		register Sinatra::Reloader
	end

	get '/' do
		erb :index	
	end

	post '/names' do
		player_1 = Player.new(params[:player_1_name]) 
		player_2 = Player.new(params[:player_2_name])
		p player_1
		p player_2
		$game = Game.new(player_1, player_2)
		p $game
		redirect '/play'
	end

	get '/play' do
		@game = $game
		erb :play
	end

	post '/action' do
		# @player_1 = $Player1 
		# @player_2 = $Player2
		# @action = params[:attack]
		@game = $game
		@game.attack(@game.player_2)
		erb :action
	end

	run! if app_file == $0
end
