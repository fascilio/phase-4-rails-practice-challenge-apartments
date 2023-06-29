class LeasesController < ApplicationController
    def create
        lease = Lease.new(lease_params)
        if lease.save
            render json: lease, status: :created
        else
            render json: { error: lease.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.require(:lease).permit(:rent, :apartment_id, :tenant_id)
    end
end
