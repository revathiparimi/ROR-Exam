class Users::RegistrationsController < Devise::RegistrationsController
  
  before_filter :authenticate_user!
  
  def new
  	super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="you have signed up successfully"
      render "users/sessions/new"
    else
      render :action => :new
    end
  end

  def update
    super
  end

   private
    
    def user_params
      params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip)
    end
end 
