class ServiceOrganizationsController < ApplicationController
    def new
        @service_type = ServiceType.find(params[:service_type_id])
        @service_organization = @service_type.service_organizations.new
    end

    def create
        @service_type = ServiceType.find(params[:service_organization][:service_type_id])
        @service_organization = @service_type.service_organizations.create(service_organization_params)
        if @service_organization.save
            redirect_to service_type_path(@service_type)
        else
            render 'new'
        end
    end

    def edit
        @service_type = ServiceType.find(params[:service_type_id])
        @service_organization = @service_type.service_organizations.find(params[:id])
    end

    def update
        @service_type = ServiceType.find(params[:service_organization][:service_type_id])
        @service_organization = @service_type.service_organizations.find(params[:id])
        if @service_organization.update(service_organization_params)
            redirect_to service_type_path(@service_type)
        else
            render 'edit'
        end
    end

    def destroy
        @service_type = ServiceType.find(params[:service_type_id])
        @service_organization = @service_type.service_organizations.find(params[:id])
        @service_organization.destroy
        redirect_to service_type_path(@service_type)
    end

    private
    def service_organization_params
        params.require(:service_organization).permit(:organization,:address,:number,:website,:hours)
    end
end
