class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
