class CardsController < ApplicationController
	def index
		puts "OUTPUT** #{params}"

		if params[:commit] == "Search"
			@cards = Card.getir(params[:search])
		elsif params[:commit] == "Filter"
			@cards = Card.getir(params)
		else
			@cards = Card.where("collectible = ?", "t")
		end
	end
end
