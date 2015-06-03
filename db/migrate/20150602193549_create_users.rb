class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :user_img
      t.string :blurb, default: "Eu putent convenire iudicabit est, illud everti bonorum usu ut. Nostro inermis eu mei, vel quodsi malorum salutatus id. Et tale possim eam, te illud facilisis disputando ius. Mel cu illud soleat, vix iusto mediocritatem id, ne vocent quaestio voluptaria mei. Primis prodesset delicatissimi at eum, lobortis torquatos mel an. Eu prima civibus neglegentur sed."
      t.boolean :show_contact, default: true

      t.timestamps
    end
  end
end
