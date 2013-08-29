class TypeSubTypeTerm < Term
	mixin_directories :type_subtype, :general
	puts "I found typesubtype"

	self_identify do |term|
		0
	end

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