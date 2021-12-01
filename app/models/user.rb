class User < ApplicationRecord

  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    before_save {self.email=email.downcase}
    has_many :bookings,dependent: :destroy
    validates :username,presence: true,uniqueness: {case_sensitive: false},length: {minimum: 3,maximum: 10}
    regex_email=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence: true,uniqueness: {case_sensitive: false},format: {with:regex_email,message: "Enter correct email id"}
    has_secure_password

    enum role: [:user, :admin]

    
end