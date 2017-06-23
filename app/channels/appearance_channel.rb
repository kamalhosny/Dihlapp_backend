class AppearanceChannel < ApplicationCable::Channel
	def subscribed
		current_user.appear
	end

	def unsubscribed
		current_user.disappear
	end

	def appear(data)
		current_user.appear(on: data['appearing_on'])
	end

	def away
		current_user.away
	end
end

# The Above channel is not implemented properly yet as we integrated the action cable of the messages only