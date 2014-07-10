class Bike

	def broken?
		@broken ||= false
	end

	def break!
		@broken = true
	end
	
	def fix!
		@broken = false
	end
end

# might need to use self for the break! & fix! methods. 
# we also don't initialise. Do we need to?