class LendersController < ApplicationController
    before_action :require_login, except: [:create]
    def create
        lender = Lender.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], money: params[:money])
        if lender.valid?
            session[:user_id] = lender.id
            session[:user_type] = "Lender"
            flash[:errors] = ["New Lending Account Successfully Created"]
            redirect_to "/lenders/#{lender.id}"
        else
            flash[:errors] = lender.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        @borrowers = Borrower.all
        @lent = 0
        if current_user.loans
            current_user.loans.each do |loan|
                @lent += loan.amount
            end
        end

        render "lenders/show.html"
    end
end
