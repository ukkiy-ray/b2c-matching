class CreateCompanyRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :company_relations do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
