class CreateModelDemos < ActiveRecord::Migration[6.0]
  def change
    create_table :model_demos do |t|
      t.string :title

      t.timestamps
    end
  end
end
