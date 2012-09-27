class ChangeMonthController < ApplicationController
	def create
		date = params[:date]
		if is_admin(current_user)
            redirect_to clients_path(:date => date)
          else
            redirect_to roclients_path(:date => date)
        end
	end

end
