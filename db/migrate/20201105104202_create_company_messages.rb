class CreateCompanyMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :company_messages do |t|
      t.text :message
      t.references :room, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
