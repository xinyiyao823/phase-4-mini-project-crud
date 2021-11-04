class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    def create 
        spice = Spice.create(spice_params)
        if spice
            render json: spice, status: :created
        else
            render json: { error: "Unable to create new spice" }
        end
    end

    def update 
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        # head: no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
