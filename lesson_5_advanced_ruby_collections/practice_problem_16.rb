=begin
A UUID is a type of identifier often used as a way to uniquely identify items...
which may not all be created by the same system. That is, without any form of synchronization, 
two or more separate computer systems can create new items and label them with a UUID with no 
significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 
3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 
8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end

HEX_CHARS = ('0'..'9').to_a + ('a'..'f').to_a
SECTION_SIZES = [8, 4, 4, 4, 12]

def create_uuid
  uuid = ''
  index = 0
  while index < SECTION_SIZES.size
    SECTION_SIZES[index].times { uuid << HEX_CHARS.sample }
    uuid << '-' unless index >= SECTION_SIZES.size - 1
    index += 1
  end
  uuid
end

p create_uuid


# Using #each_with_index
def create_uuid2
  uuid = ''
  SECTION_SIZES.each_with_index do |size, index|
    size.times do
      uuid << HEX_CHARS.sample
    end
    uuid << '-' unless index >= SECTION_SIZES.size - 1
  end
  uuid
end

p create_uuid2

# SecureRandom#uuid method
require 'securerandom'

p SecureRandom.uuid