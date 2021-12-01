require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/player'

class Battle < Sinatra::Base
	enable :sessions
	
	configure :development do
		register Sinatra::Reloader
	end

	get '/' do
		erb :index	
	end

	post '/names' do
		$Player1 = Player.new(params[:player_1_name]) 
		$Player2 = Player.new(params[:player_2_name]) 
		redirect '/play'
	end

	get '/play' do
		@player_1_name = $Player1.name
		@player_2_name = $Player2.name
		erb :play
	end

	post '/action' do
		@player_1_name = $Player1.name
		@player_2_name = $Player2.name
		@action = params[:attack]
		erb :action
	end

	run! if app_file == $0
end
