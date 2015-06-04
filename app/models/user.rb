class User < ActiveRecord::Base

  has_secure_password
  
  has_attached_file :user_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_img, :content_type => /\Aimage\/.*\Z/

  validates :username, :email, presence: true
  validates :password, length: { in: 6..20 }, on: :create

  has_many :teachables
  has_many :learnables

  has_many :teachable_skills, through: :teachables, source: 'skill'
  has_many :learnable_skills, through: :learnables, source: 'skill'

  def get_teachers
    User.joins(teachables: {skill: {learnables: :user}}).where("users_skills.id = ? and users.id != ?", id, id).distinct
  end

  #returns and array of User object of people who can learn you want you want to teach
  def get_students  
    User.joins(learnables: {skill: {teachables: :user}}).where("users_skills.id = ? and users.id != ?", id, id).distinct
  end

  def get_matches
    get_teachers & get_students
  end


  def i_learn_they_teach(user)
     (learnable_skills.map &:name) & (user.teachable_skills.map &:name) 
  end

  def i_teach_they_learn(user)
     (teachable_skills.map &:name) & (user.learnable_skills.map &:name)
  end

  #returns an array of User objects
 

end
