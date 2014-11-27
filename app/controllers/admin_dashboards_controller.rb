class AdminDashboardsController < ApplicationController

	before_action :authenticate_admin!, only: [:index, :update, :show]
  def index
  	@videos=Video.all
  end

  def update
    email=params[:email]
    type=params[:account_type]
    @user=User.find_by email:email
    @user.account_type=type
    if @user.save
      flash[:updated]="Account type updated successfully"
    end
      @users=User.all
    render "/admins/show"
  end

  def show
   	@users=User.all
  end

  def view
  end
  
  

  def upload
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

end