class ClientsController < ApplicationController

	before_action :authenticate_user!



def index 
		@clients = current_user.clients
	end

def new

	@client = Client.new

end

def create

	@client = Client.new(client_params)
	@client.user_id = current_user.id #used to attach this client to the currently logged in user

	if @client.save #passes validation - clients_path returns "/clients"
		redirect_to clients_path, notice:"succefully created client"
	else #display error messages
			
		render action: "new"
	end
end

def show 
	begin

	@client = current_user.clients.find(params[:id])

rescue ActiveRecord::RecordNotFound


redirect_to clients_path, notice: "record not found"
	#@client = Project.where('client_id ?',@client_id)
	
end

end

def edit
	@client = Client.find(params[:id])
end

def update 
	@client = Client.find(params[:id])
	if @client.update_attributes(client_params)
		redirect_to client_path(@client), notice:"successfully updated"
	else
		render action: "edit"
	end

end

def destroy


@client = Client.find(params[:id])
	@client.destroy
    redirect_to client _path, notice:"successfully destroyed"
		
end


private

def client_params
	params[:client].permit(:name,:mobile,:website,:company,:email)
end

end

