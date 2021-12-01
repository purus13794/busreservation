class UsersController < ApplicationController
    before_action :set_user,only: [:show,:edit,:update,:destroy]
    def show
        @bookings=@user.bookings
    end

    def index
        @users=User.all
    end
    
    def new
        @user = User.new
    end

    def edit
    
    end
    
    def update
        @user=User.find(params[:id])
        if @user.update(user_params)
            flash[:notice]="Details updates sucessfully"
            redirect_to @user

        else
            render "edit"
        end
    end
    

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id] =@user.id
            flash[:notice] ="signed in sucessfully as #{@user.username}"
            redirect_to bookings_path
        else
            render 'new'
        end
    end

    def destroy 
        @user.destroy 
        session[:user_id] = nil if @user ==current_user
        flash[:notice]='account and all associated bookings deleted'
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password_digest,:image,:role)
    end

    def set_user
        @user=User.find(params[:id])
    end

end