class TypeSubTypeTerm < Term
	def type 	
		@words[1,@words.length].join ' '
	end

	def subtype
		@words[0]
	end
end