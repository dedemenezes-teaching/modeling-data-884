class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    load_csv
  end

  # >> !!TODAY YOU'RE GONNA USE THIS!! <<
  def add_patient(patient)
    # @patients = []; id should be 1
    # @patients has 10 patients; id should be @patients.last.id + 1
    patient.id = @patients.empty? ? 1 : @patients.last.id + 1
    @patients << patient
    #save_csv #=> It's not defined, it won't work
  end

  def all
    @patients
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row,  header_converters: :symbol) do |row|
      # PREPARE THE ROW
      # CSV - String
      # 1st iteration
      # row[:id] #=> "1"
      # row[:cured] #=> "2"
      # row[:name] #=> "Harry"
      # row[:room_id] #=> "1"
      # App - Convert Data Types - Integer, String, Instances...

      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true" #=> "false"
      # Retrive the room instance
      # Room Repo will do it, we need to ask
      room_id = row[:room_id].to_i
      row[:room] = @room_repository.find(room_id)
      @patients << Patient.new(row)
    end
  end
end
