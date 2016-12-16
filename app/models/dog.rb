class Dog < Pet
	validates_presence_of :breed
	BREEDS = %w(labrador poodle spaniel terrier)


end