class Customer < ApplicationRecord
  has_paper_trail

  validates :first_name, :last_name, :birthday, :country, presence: true
  validate :birthday_date, on: %i[create update], if: :birthday

  private
  def birthday_date
    errors.add(:birthday, ' must be an earlier date.') if birthday > Time.now
  end
end
