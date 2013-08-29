class SingleTerm < Term
	mixin_directories :single_word, :general

	self_identify do |term|
		100
	end
end