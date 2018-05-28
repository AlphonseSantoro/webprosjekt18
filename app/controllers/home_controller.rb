# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :set_locale

  def index
  end

  def logistic_planner
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
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.916114, long: 10.759968 })
    @campus = 'Fjerdingen'
    foodexpress = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Chr.+Krohgs+gate+41,+0186+Oslo'}
    @foodexpress = Directions.new(foodexpress, session[:locale])
    prix = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Hausmanns+gate+19,+0182+Oslo'}
    @prix = Directions.new(prix, session[:locale])
    rema1000 = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Chr.+Krohgs+gate+1-11,+0186 Oslo'}
    @rema1000 = Directions.new(rema1000, session[:locale])
    sudost = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Trondheimsveien+5,+0560+Oslo'}
    @sudost = Directions.new(sudost, session[:locale])
    freddy = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Hausmanns+gate+31a,+0182+Oslo'}
    @freddy = Directions.new(freddy, session[:locale])
    burgerking = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Torggata+24,+0183+Oslo'}
    @burgerking = Directions.new(burgerking, session[:locale])
    dominos = {from: 'Chr.+Krohgs+gate+32,+0186+Oslo', to: 'Thorvald+Meyers+gate+72,+0552+Oslo'}
    @dominos = Directions.new(dominos, session[:locale])
  end

  def kvadraturen
    @bikes = GoogleMaps.new(params).city_bikes({lat: 59.9111398, long: 10.7450366})
    @campus = 'Kvadraturen'
    matkroken = {from: 'Kirkegata+24,+0153+Oslo', to: 'Kongens+gate+23,+0153+Oslo'}
    @matkroken = Directions.new(matkroken, session[:locale])
    coopKvad = {from: 'Kirkegata+24,+0153+Oslo', to: 'Postgirobygget,+Biskop+Gunnerus+gate+14,+0155+Oslo'}
    @coopKvad = Directions.new(coopKvad, session[:locale])
    joker = {from: 'Kirkegata+24,+0153+Oslo', to: 'Jernbanetorget+1,+0154+Oslo'}
    @joker = Directions.new(joker, session[:locale])
    kiwiKvad = {from: 'Kirkegata+24,+0153+Oslo', to: 'Byporten+Shopping,+Jernbanetorget+9,+0154+Oslo'}
    @kiwiKvad = Directions.new(kiwiKvad, session[:locale])
    steenogStrom = {from: 'Kirkegata+24,+0153+Oslo', to: 'Nedre+Slottsgate+8,+0157+Oslo'}
    @steenogStrom = Directions.new(steenogStrom, session[:locale])
    ostBaneHallen = {from: 'Kirkegata+24,+0153+Oslo', to: 'Ostbanehallen,+Jernbanetorget+1,+0154+Oslo'}
    @ostBaneHallen = Directions.new(ostBaneHallen, session[:locale])
    burgerKingKvad = {from: 'Kirkegata+24,+0153+Oslo', to: 'Burger+King,+Karl+Johans+gate+8,+0154+Oslo'}
    @burgerKingKvad = Directions.new(burgerKingKvad, session[:locale])
    peppesPizzaKvad = {from: 'Kirkegata+24,+0153+Oslo', to: 'Jernbanetorget+1,+0154+Oslo'}
    @peppesPizzaKvad = Directions.new(peppesPizzaKvad, session[:locale])
    subwayKvad = {from: 'Kirkegata+24,+0153+Oslo', to: 'Kirkegata+32,+0153+Oslo'}
    @subwayKvad = Directions.new(subwayKvad, session[:locale])
  end

  def vulkan
    @bikes = GoogleMaps.new(params).city_bikes({ lat: 59.923312, long: 10.752354 })
    @campus = 'Vulkan'
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
