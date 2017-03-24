class LoansController < ApplicationController
    before_action :require_login
    def create
        @lent = 0
        if current_user.loans
            current_user.loans.each do |loan|
                @lent += loan.amount
            end
        end
        @balance = current_user.money - @lent
        if params[:loan_amount] > @balance.to_s
            flash[:errors] = ["Sorry, you do not have enough money to make this loan :("]
            redirect_to "/lenders/#{current_user.id}"
        else
            Loan.create(lender: current_user, borrower_id: params[:id], amount: params[:loan_amount])
            redirect_to "/lenders/#{current_user.id}"
        end
    end
end
