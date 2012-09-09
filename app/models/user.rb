class User < ActiveRecord::Base
	# goal - goal_post - comment
	has_many :goals
	has_many :goal_posts
	has_many :comments

  mount_uploader :avatar, AvatarUploader

	# user relationships
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followers, through: :reverse_relationships, source: :follower

  # user angelships
  has_many :angelships, foreign_key: "angel_id", dependent: :destroy
  has_many :dreamers, through: :angelships, source: :dreamer
  has_many :reverse_angelships, foreign_key: "dreamer_id", class_name: "Angelship", dependent: :destroy
  has_many :angels, through: :reverse_angelships, source: :angel

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,:token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:uid]

  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :uid, :password, :password_confirmation, :avatar, :email, :authentication_token

  # follow method
  def following?(other_user)
  	relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
  	relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
  	relationships.find_by_followed_id(other_user.id).destroy
  end

  # angel method
  def angel?(other_user)
    angelships.find_by_angel_id(other_user.id)
  end

  def dreamer?(other_user)
    angelships.find_by_dreamer_id(other_user.id)
  end

  def angel!(other_user)
    angelships.create!(dreamer_id: other_user.id)
  end

  def unangel!(other_user)
    angelships.find_by_dreamer_id(other_user.id).destroy
  end

  protected
    def email_required?
      false
    end

    def password_required? 
      false 
    end 
end
