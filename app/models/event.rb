class Event < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :organizer_name, presence: true
  validates :organizer_email, presence: true
  validates :date, presence: true
  validate :date_is_ok
  validate :email_format

  def date_is_ok
    if 
      date >= Date.today && DateTime.parse
    else
      errors.add(:date, "must be valid date")
    end
  end

  def email_format
    if 
      organizer_email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
    else
      errors.add(:organizer_email, "must be valid email address")
    end
  end

end