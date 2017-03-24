class SessionsController < ApplicationController
    def new
        session[:user_id] = nil
        session[:user_type] = nil
        render "sessions/new.html.erb"
    end

    def show
        session[:user_type] = params[:type]
        render "sessions/login.html.erb"
    end

    def create
        if session[:user_type] == "Lender"
            if lender = Lender.find_by(email: params[:email])
                if lender.authenticate(params[:password])
                    session[:user_id] = lender.id
                    flash[:errors] = ["Successfully Logged In!"]
                    redirect_to "/lenders/#{lender.id}"
                else
                    flash[:errors] = ["Invalid Password"]
                    redirect_to "/login"
                end
            else
                flash[:errors] = ["This email does not have an account. Please register here!"]
                redirect_to "/"
            end
        end
        if session[:user_type] == "Borrower"
            if borrower = Borrower.find_by(email: params[:email])
                if borrower.authenticate(params[:password])
                    session[:user_id] = borrower.id
                    flash[:errors] = ["Successfully Logged In!"]
                    redirect_to "/borrowers/#{borrower.id}"
                else
                    flash[:errors] = ["Invalid Password"]
                    redirect_to "/login"
                end
            else
                flash[:errors] = ["This email does not have an account. Please register here!"]
                redirect_to "/"
            end
        end
    end

    def destroy
        session[:user_id] = nil
        session[:user_type] = nil
        flash[:errors] = ["Successfully Logged Out!"]
        redirect_to "/"
    end
end
