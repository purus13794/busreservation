class SessionController <ApplicationController
    def new

    end

    def create
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.password_digest==params[:session][:password] && user.role=='admin'
            session[:user_id]=user.id
            flash[:notice]="logged in sucessfully"
            redirect_to users_path
        elsif user && user.password_digest==params[:session][:password]
            session[:user_id]=user.id
            flash[:notice]="logged in sucessfully"
            redirect_to user

        else
            flash.now[:notice]="Incorrect credentials"
            render 'new'
        end
    end

    def destroy
        session[:user_id] =nil
        flash[:notice]="Looged out"
        redirect_to root_path
    end

end