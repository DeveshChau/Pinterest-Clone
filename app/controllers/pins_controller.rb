class PinsController < ApplicationController

	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@pins = Pin.all
	end

	def new
		@pin = current_user.pins.build
	end
	
	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Successfully Pin Created"
		else
			render 'new'
		end		
	end
	
	def show
		
	end
	
	def edit
		
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Successfully Pin Updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path, notce: "Successfully Pin Deleted"
	end

	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	private
		def find_pin
			@pin = Pin.find(params[:id])
		end

		def pin_params
			params.require(:pin).permit(:title, :description, :image)
		end
end
