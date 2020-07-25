class Character < ApplicationRecord
  belongs_to :user

  enum race: { human: 0, elf: 1, dwarf: 2 }
  enum job: { fighter: 0, mage: 1, thief: 2 }

  validates :name, presence: true, length: { maximum: 30 }
  validates :level, :strength, :agility, :intelligence, presence: true, numericality: { greater_than_or_equal_to: 1 }

end
