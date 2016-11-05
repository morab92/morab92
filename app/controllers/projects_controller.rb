class ProjectsController < ApplicationController


	before_action :authenticate_user!


	def index 
		@projects = current_user.projects
	end


	
	def new

		@project = Project.new

	end

	def create
		@project = Project.new(project_params)

		@project.user_id = current_user.id

		if @project.save 
			redirect_to projects_path, notice:"succefully created project"
		else 

			render action: "new"
		end
	end

	def show

		@project = Project.find(params[:id])

		@task = Task.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update 
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to project_path(@project), notice:"successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path, notice:"successfully destroyed"
	end


	private

	def project_params
		params[:project].permit(:name,:start_date,:description,:client_id,:status,category_ids:[])
	end

end