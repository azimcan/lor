class Card < ApplicationRecord
	self.inheritance_column = :_type_disabled

	def self.getir(params)
  	if params.class == String
	  	search(params)
	  elsif params.class == ActionController::Parameters
	  	params.delete("commit")
			params.delete("controller")
			params.delete("action")
	  	filter(params)
	  else
	  	self.all
	  end
	end

	def self.search(params)
		query = [
			# "associatedCardRefs", 
			# "assets", 
			"region", 
			# "regionRef", 
			# "attack", 
			"cost", 
			# "health", 
			"description", 
			# "descriptionRaw", 
			# "levelupDescription", 
			# "levelupDescriptionRaw", 
			# "flavorText", 
			# "artistName", 
			"name", 
			# "cardCode", 
			"keywords", 
			# "keywordRefs", 
			"spellSpeed", 
			# "spellSpeedRef", 
			"rarity", 
			# "rarityRef", 
			"subtype", 
			# "subtypes", 
			"supertype", 
			"type", 
			# "collectible"
		]

	 	list = params.split(' ') unless params.nil?

		result = []
		unless list.empty?
			query.each do |column|
				list.each do |word|
	    		result = result | self.where("collectible = ? AND \"#{column}\"" LIKE ?","t", "%#{word}%")
	    	end
			end
		else
			result = self.all
		end
		result
	end

	def self.filter(params)
		result = []

		if params.include? :type
			if (params.include? :regions) && (params.include? :costs)
				params[:regions].each do |region|
					params[:costs].each do |cost|
						result |= self.where("collectible = ? AND region = ? AND cost = ? AND type = ?","t", region, cost, params[:type])
					end
				end
			elsif params.include? :regions
				params[:regions].each do |region|
					result |= self.where("collectible = ? AND region = ? AND type = ?","t", region, params[:type])
				end
			elsif params.include? :costs
				params[:costs].each do |cost|
					result |= self.where("collectible = ? AND cost = ? AND type = ?","t", cost, params[:type])
				end
			else
				result = self.where("collectible = ? AND type = ?","t", params[:type])
			end
		else
			if (params.include? :regions) && (params.include? :costs)
				params[:regions].each do |region|
					params[:costs].each do |cost|
						result |= self.where("collectible = ? AND region = ? AND cost = ?","t", region, cost)
					end
				end
			elsif params.include? :regions
				params[:regions].each do |region|
					result |= self.where("collectible = ? AND region = ?","t", region)
				end
			elsif params.include? :costs
				params[:costs].each do |cost|
					result |= self.where("collectible = ? AND cost = ?","t", cost)
				end
			else
				result = self.all
			end
		end	

		result
	end

	def show
		puts <<-TEXT
associatedCardRefs    : #{self.associatedCardRefs}
assets                : #{self.assets}
region                : #{self.region}
regionRef             : #{self.regionRef}
attack                : #{self.attack}
cost                  : #{self.cost}
health                : #{self.health}
description           : #{self.description}
descriptionRaw        : #{self.descriptionRaw}
levelupDescription    : #{self.levelupDescription}
levelupDescriptionRaw : #{self.levelupDescriptionRaw}
flavorText            : #{self.flavorText}
artistName            : #{self.artistName}
name                  : #{self.name}
cardCode              : #{self.cardCode}
keywords              : #{self.keywords}
keywordRefs           : #{self.keywordRefs}
spellSpeed            : #{self.spellSpeed}
spellSpeedRef         : #{self.spellSpeedRef}
rarity                : #{self.rarity}
rarityRef             : #{self.rarityRef}
subtype               : #{self.subtypes}
supertype             : #{self.supertype}
type                  : #{self.type}
collectible           : #{self.collectible}
		TEXT
	end
end
