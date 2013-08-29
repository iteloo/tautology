class Term

	def initialize(words_array)
		@words = words_array
		@string = @words.join ' '
	end

	# The self_identify function puts the 
	# identity of the phrase up to a vote among all
	# existing subclasses of Term. It allows them
	# to identify how much they "like" the phrase numerically.
	# Then this guy will subclass itself to the highest bidder.
	def self.self_identify &block
		# The self identifiers array will contain the phrase evalutation 
		# functions.
		puts "Show me that verb baby"
		@@self_identifiers = {} if !defined? @@self_identifiers
		@@self_identifiers[self.to_s] = block
	end

	def becomes_true_self 
		ranks = {}
		if defined? @@self_identifiers
			@@self_identifiers.each do |k,block|
				ranks[k] = block.call self
			end
		end
		puts ranks.to_json
		if ranks.count > 0
			classname = (ranks.sort_by { |k,v| v }).first[0]
			return classname.constantize.new @words
		else
			raise "There is no true self..."
			return self
		end
	end

	# The mixin_directories function will allow subclass
	# instances to specify their preferred view directories.
	def self.mixin_directories *dirs
		@directories = [] if !defined? @directories
		dirs.each do |d|
			@directories.push d
		end
	end

	# This function allows subclasses to identify
	# mixin directories for inclusion.
	def mixin_directories *dirs 
		self.class.mixin_directories *dirs
	end

	# This function returns some kind of weird annotated
	# string with some info about what each word is
	# like if it is a noun or something? I don't know
	def part_of_speech
		PartOfSpeech.analyze Rails.root.join('lib', 'assets', 'lexicon.txt'), @string
	end

	def is_singular?
		if @string.pluralize == @string
			return false
		else
			return true
		end
	end

	def is_plural?
		return !self.is_singular?
	end

	# This will pluralize the string in the opposite
	# way from how it is currently pluralized.
	def opposite_pluralization
		if self.is_singular?
			return @string.pluralize
		else
			return @string.singularize
		end
	end

	# Renders the Term object as a string, which is just
	# the actual term itself.
	def to_s 
		@string
	end

	# I don't know why I implemented this, it is probably
	# better to just use to_s for inspect
	def inspect 
		return self.to_json
	end
end