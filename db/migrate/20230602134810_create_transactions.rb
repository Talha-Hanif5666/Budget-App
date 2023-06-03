class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.bigint :amount, default: 0
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :category, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end