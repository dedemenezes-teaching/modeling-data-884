require_relative 'patient'

class Room
  attr_accessor :id
  # STATE/PROPERTIES
  # capacity => Integer
  # patients = Array of PATIENT INSTANCES
  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  # BEHAVIOURS
  def full?
    # check the size array
    @patients.length == @capacity
  end

  def add_patient(patient)
    # self => is the room on which .add_patient was called
    
    raise Exception, 'Room is full.' if self.full?
    @patients << patient
    patient.room = self
  end
end

# room_one = Room.new(capacity: 2)

# # ASSIGN A PATIENT TO THE ROOM
# draco = Patient.new(name: "Draco")
# Add the patient to the room
# room_one.add_patient(draco)
# Ask the patient which room he/she/they are in
# p draco.room

# harry = Patient.new(name: "harry")
# room_one.add_patient(harry)
# p room_one
# gina = Patient.new(name: "gina")
# room_one.add_patient(gina)

# p room_one
