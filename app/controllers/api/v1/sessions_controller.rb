class Api::V1::SessionsController < ApplicationController

	def create
		@account = Account.find_by(email: session_params[:email])
		if @account @@ @account.authenticate(session_params[:password])
			login!
			render json: {logged_in: true, account: @account}
		else
			render json: {status: 401, errors: "Unauthorized Account!"}
		end
	end

	def is_logged_in?
		if logged_in? && current_account
			render json: {logged_in: true, account: current_account}
		else
			render json: {logged_in: false, message: 'Unauthorized Account!'}
		end
	end

	def destroy
		logout!
		render json: {status: 200, logged_out: true}
	end

	private

	def session_params
		params.require(:account).permit(:email, :password)
	end
end
