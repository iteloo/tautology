class DefinitionController < ApplicationController
	layout 'dictionary'

	# This does the work of including ALL models ever!
	Dir[Rails.root + 'app/models/*.rb'].each do |path|
  		require path
	end

	def search
		@words = params[:searchstring].split '-'
		@term = Term.new @words
		@term = @term.becomes_true_self

		puts "Term became a #{@term.class.name}"
		
		@mixins = self.get_relevant_partials(@term)
		render "result"
	end


	def get_relevant_partials(term)
		# This function gets a bunch of partials from the "/views/term_handlers/*" directories
		# and uses them to construct an article. The chosen partials get returned.
		mixins = []
		views = []

		# First, seed the random article based upon the word choice so that
		# articles appear to remain the same, even though they are 
		# actually random.
		Random.srand Digest::MD5.hexdigest(@term.to_s).to_i(16)

		# Now find all of the possible relevant articles by asking the term which 
		# directories of articles it supports.
		Dir.chdir Rails.root.join('app','views')
		term.mixin_directories.each do |m|
			Dir.glob("term_handlers/#{m.to_s}/*").each do |view|
				views.push view
			end
		end

		# Now assemble some fraction of those views and return them.
		views.shuffle!

		if views.count > 0
			for i in 1..(1+ Random.rand(views.count) )
				mixins.push views.pop
			end
		end

		puts "And now we show the mixins..."
		puts mixins.to_json

		return mixins
	end
end
