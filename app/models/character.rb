class Character < ApplicationRecord
  belongs_to :user

  enum race: { human: 0, elf: 1, dwarf: 2 }
  enum job: { fighter: 0, mage: 1, thief: 2 }

end
