class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  def role?(base_role)
    role == base_role.to_s
  end
  
end






