class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :first_address
      t.string :second_address
      t.string :third_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :first_phone
      t.string :second_phone
      t.string :first_fax
      t.string :second_fax

      t.timestamps
    end
  end
end
