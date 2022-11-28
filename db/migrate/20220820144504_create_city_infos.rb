class CreateCityInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :city_infos do |t|
      t.references :city, null: false, foreign_key: true
      t.float :coef_rsu_per_capita, null: false
      t.float :coef_metal_ferroso, null: false
      t.float :coef_metal_nao_ferroso, null: false
      t.float :coef_plastico_filme, null: false
      t.float :coef_plastico_rigido, null: false
      t.float :coef_papel_papelao, null: false
      t.float :coef_vidro, null: false
      t.float :price_metal_ferroso, null: false
      t.float :price_metal_nao_ferroso, null: false
      t.float :price_plastico_filme, null: false
      t.float :price_plastico_rigido, null: false
      t.float :price_papel_papelao, null: false
      t.float :price_vidro, null: false

      t.timestamps
    end
  end
end
