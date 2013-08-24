class DefinitionController < ApplicationController
	layout 'dictionary'
	def search
		@words = params[:searchstring].split '-'
		if @words.length > 1
			self.type_subtype
		else
			self.single_word
		end
	end

	def single_word
		@term = Term.new @words
		render 'term_handlers/single_word'
	end

	def type_subtype
		@term = TypeSubTypeTerm.new @words
		render 'term_handlers/type_subtype'
	end
end
