class VideosController < ApplicationController

	before_action :authenticate_user!, only: [:index]

	def index
		@current_user = current_user.email

		$id = (User.find_by email:@current_user).id
		ApiKey.new.generate_access_token

		@acc_type = (User.find_by email:@current_user).account_type

		if @acc_type == "Gold"
				@videos = Video.all
		elsif @acc_type == "Silver"
				@videos = Video.where.not(account_type: "Gold")
		else
				@videos = Video.where(account_type: "Free")
		end

		respond_to do |format|
	    format.html #{ render json: @videos.as_json(except: [:id, :created_at, :updated_at ]) }
	    #{ render json: @videos.as_json(only: [:url, :Account_type]) }# index.html.erb
	    # format.xml  { render xml: @videos}
	    # format.json { render json: @videos.as_json(only: [:url, :Account_type]) }
	    end
	end	

	def show
		@videos = Video.where(account_type: "Free")	
	end	

 end