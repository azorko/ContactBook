class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :name, presence: true
  validates :user_id, presence: true
  
  has_one(
    :owner,
    through: :contact_share,
    source: :user
  )
  
  has_one(
    :contact_share,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  belongs_to :user
  
end
