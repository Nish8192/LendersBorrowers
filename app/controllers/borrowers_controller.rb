class BorrowersController < ApplicationController
    before_action :require_login, except: [:create]
    def create
        borrower = Borrower.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], reason: params[:reason], description: params[:description], needed: params[:needed])
        if borrower.valid?
            session[:user_id] = borrower.id
            session[:user_type] = "Borrower"
            flash[:errors] = ["New Borrowing Account Created Successfully!"]
            redirect_to "/borrowers/#{borrower.id}"
        else
            flash[:errors] = borrower.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        @raised = 0
        @lenders = Lender.all
        if current_user.loans
            current_user.loans.each do |loan|
                @raised += loan.amount
            end
        end
        render "borrowers/show.html.erb"
    end
end
