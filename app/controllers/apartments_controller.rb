class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment
    end

    def create
        apartment = Apartment.new(apartment_params)
        if apartment.save
            render json: apartment, status: :created
        else
            render json: { error: apartment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        apartment = Apartment.find(params[:id])
        if apartment.update(apartment_params)
            render json: apartment
        else
            render json: { error: apartment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private

    def apartment_params
        params.require(:apartment).permit(:number)
    end

end
