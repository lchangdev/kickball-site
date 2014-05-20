require 'sinatra'
require 'csv'

def load_players
  players = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |row|
    players << row.to_hash
  end

  players
end

def load_teams
  teams = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |row|

    teams << row[:team]
  end

  teams
end

def load_positions
  positions = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |row|

    positions << row[:position]
  end

  positions
end


get '/' do

  @players = load_players
  @teams = load_teams
  @positions = load_positions

  erb :index
end

get '/teams/:team' do

  @players = load_players
  # @teams = load_teams

  @player = @players.find do |player|
    player[:team] == params[:team]
  end

  erb :'teams/show'

end

get '/positions/:position' do

  @players = load_players
  # @teams = load_teams

  @player = @players.find do |player|
    player[:position] == params[:position]
  end

  erb :'positions/show2'

end
