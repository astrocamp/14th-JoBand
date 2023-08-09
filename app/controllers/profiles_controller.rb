class ProfilesController < ApplicationController
    
    def index
        
    end
    
    def new
        @profile = Profile.new
        @profile.instruments.new
    end
    
    def create
        @profile = Profile.new(params_profile)
        if @profile.save
            redirect_to profiles_path, notice: "新增 profile 成功"
        else
            render :new
        end
        
    end
    
    def show
        
    end
    
    def edit
        
    end
    
    def update
        
    end

    def params_profile
        params.require(:profile).permit(:name, :phone, :location, :seniority, :content, instruments_attributes: [:vocal, :guitar, :bass, :keyboard, :drum, :others])
    end
    
end
