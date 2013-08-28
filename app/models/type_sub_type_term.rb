class TypeSubTypeTerm < Term
	mixin_directories :type_subtype
	
	def initialize(terms)
		super terms
		
	end

	def type 	
		@words[1,@words.length].join ' '
	end

	def subtype
		@words[0]
	end

end