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
		$game = Game.new(player_1, player_2)
		redirect '/play'
	end

	get '/play' do
		@game = $game
		erb :play
	end

	post '/action' do
		@game = $game
		if @game.active_player == @game.player_1
			@game.attack(@game.player_2)
			@game.switch_player
		elsif @game.active_player == @game.player_2
			@game.attack(@game.player_1)
			@game.switch_player
		end
		erb :action
	end

	run! if app_file == $0
end
