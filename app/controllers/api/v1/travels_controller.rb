module API
  module V1
    class TravelsController < ApplicationController

      # before_action :authenticate
      before_action :find_travel_category

      # GET /travels
      # GET /travels.json
      def index
        travels = Travel.where(:travel_category_id => @travel_category)
        # if weapon = params[:weapon]
        #   travels = travels.where(name: weapon)
        # end

        respond_to do |format|
          #format.html { render :new }
          format.json { render json: travels, status: 200 }
          format.xml { render xml: travels, status: 200 }
        end

       # render json: travels, status: 200
      end

      # GET /travels/1
      # GET /travels/1.json
      def show
        travels = Travel.find(params[:id])
        render json: travels, status: :ok
      end

      # POST /travels
      # POST /travels.json
      def create
        travel = Travel.new(travel_params)
        if travel.save
          render json: travel, status: 201, location: travel # :created

          # if you do not want to send back
          # render nothing: true, status: 204, location: travel
        else
          render json: travel.errors, status: 422 # :unprocessable_entity
        end
      end

      # PATCH/PUT /travels/1
      # PATCH/PUT /travels/1.json
      def update
        travel = Travel.find(params[:id])
        if travel.update(travel_params)
          render json: travel, status: 200
        else
          render json: travel.errors, status: 422
        end
      end

      # DELETE /travels/1
      # DELETE /travels/1.json
      def destroy
        travel = Travel.find(params[:id])
        travel.destroy
        head 204
      end

      private

      def travel_params
        params.require(:travel).permit(:name, :position, :content, :visible)
      end

      def find_travel_category
        if params[:travel_category_id]
          @travel_category = TravelCategory.find(params[:travel_category_id])
        end
      end

    end
  end
end
