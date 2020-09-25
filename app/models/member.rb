class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :area

  validates :name, presence: true

  #性別
  enum sex: { man: 1, woman: 2, other: 0 }
  validates :sex, inclusion: { in: Member.sexes.keys }

  #年齢
  enum age: { teens: 0, twenties: 1, thirties: 2, forties: 3, fifties: 4, sixties: 5, seventies: 6, eighties: 7 }
  validates :age, inclusion: { in: Member.ages.keys }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
