class Term
	def initialize(words_array)
		@words = words_array
		@string = @words.join ' '
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

	def opposite_pluralization
		if self.is_singular?
			return @string.pluralize
		else
			return @string.singularize
		end
	end

	def to_s 
		@string
	end

	def inspect 
		return self.to_json
	end
end