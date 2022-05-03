class Patient
  attr_reader :cured, :name
  attr_accessor :room, :id

  # STATE/PROPERTIES
  # name => String
  # cured => Boolean
  # age => Integer
  # address => String
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @room = attributes[:room]
  end

  #BEHAVIOUR
  # cure the patient
  def cure!
    @cured = true
  end
end

# harry = Patient.new(name: "Harry", cured: false)
# p harry

# harry.cure!
# puts "is harry cured?"
# p harry
