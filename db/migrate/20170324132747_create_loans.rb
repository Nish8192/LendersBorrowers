class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :lender, foreign_key: true
      t.references :borrower, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
