class MastersController < ApplicationController

    def index
        render json: Master.all
    end

    def show
        master = find_master
        render json: master
    end
    
    def update
        stats = find_master
        stats.update!(stats_params)
        render json: stats
    end

    private
    
    def stats_params
        params.permit(:health, :wealth, :energy)
    end
    
    def record_not_found
        render json: {error: "Master not found"}, status: 404
    end

    def find_master
        Master.find(params[:id])
    end
end
