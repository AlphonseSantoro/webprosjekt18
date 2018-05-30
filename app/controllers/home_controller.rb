# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :set_locale

  def index
  end

  def logistic_planner
    @callback = 'initMap'
    if params[:from].nil? && params[:to].nil?
      params[:from] = 'Westerdals+Oslo+ACT,+Chr.+Krohgs gate+32,+Oslo'
      params[:to] = 'Kirkegata+24,+Oslo'
    end
    @directions = Directions.new(params, session[:locale])
    @from = Location.all_except(params[:to])
    @to = Location.all_except(params[:from])
    @all = Location.all
  end

  def fjerdingen
    @callback = 'campus'
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.916114, long: 10.759968 })
    @campus = 'Fjerdingen'
    butikker = CampusPolyline.where(campus: @campus)
    @foodexpress = butikker.where(store: 'foodexpress').first
    @prix = butikker.where(store: 'prix').first
    @rema1000 = butikker.where(store: 'rema1000').first
    @sudost = butikker.where(store: 'sudost').first
    @freddy = butikker.where(store: 'freddy').first
    @ferro = butikker.where(store: 'ferro').first
    @burgerking = butikker.where(store: 'burgerking').first
    @dominos = butikker.where(store: 'dominos').first
  end

  def kvadraturen
    @callback = 'campus'
    @bikes = GoogleMaps.new(params).city_bikes({lat: 59.9111398, long: 10.7450366})
    @campus = 'Kvadraturen'
    butikker = CampusPolyline.where(campus: @campus)
    @matkroken = butikker.where(store: 'matkroken').first
    @coopKvad = butikker.where(store: 'coopKvad').first
    @joker = butikker.where(store: 'joker').first
    @kiwiKvad = butikker.where(store: 'kiwiKvad').first
    @steenogStrom = butikker.where(store: 'steenogStrom').first
    @ostBaneHallen = butikker.where(store: 'ostBaneHallen').first
    @burgerKingKvad = butikker.where(store: 'burgerKingKvad').first
    @peppesPizzaKvad = butikker.where(store: 'peppesPizzaKvad').first
    @subwayKvad = butikker.where(store: 'subwayKvad').first
    puts @matkroken.inspect
  end

  def vulkan
    @callback = 'campus'
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.923312, long: 10.752354 })
    @campus = 'Vulkan'
    butikker = CampusPolyline.where(campus: @campus)
    @rema = butikker.where(store: 'rema').first
    @coopmega = butikker.where(store: 'coopmega').first
    @kiwifred = butikker.where(store: 'kiwifred').first
    @mathallen = butikker.where(store: 'mathallen').first
    @dognvill = butikker.where(store: 'dognvill').first
    @ferro = butikker.where(store: 'ferro').first
    @mcd = butikker.where(store: 'mcd').first
    @grytelokket = butikker.where(store: 'grytelokket').first
    @subwayvul = butikker.where(store: 'subwayvul').first
  end

  def change_locale
    locale = params[:id]
    raise 'unsupported locale' unless %w[en nb].include?(locale)
    session[:locale] = locale
    redirect_back(fallback_location: root_path)
  end

  def set_locale
    I18n.locale = session[:locale]
  end

  def set_location
    session[:latlong] = params[:latlong]
  end
end
