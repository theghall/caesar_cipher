# caesar_cipher.rb
#
# Simple cipher. Takes a string and shift distance as parameters
# from the command line.  Prints out the Casesar Cipher.
#
# 20170202	GH	Created
#

plain_text = ARGV[0].chars
shift_key = ARGV[1].to_i

a_lowercase_ord = "a".ord
z_lowercase_ord = "z".ord
a_uppercase_ord = "A".ord
z_uppercase_ord = "Z".ord

cipher_text = ""

plain_text.each do |char|

	# Only shift [A-Za-z]
	if char =~ /\p{alpha}/
		shift_value = char.ord + shift_key

		# Wrap around to start of alphabet
		if char =~ /\p{lower}/
			if shift_value > z_lowercase_ord
				shift_value = a_lowercase_ord + (shift_value - z_lowercase_ord - 1)
			end
		else
			if shift_value > z_uppercase_ord
				shift_value = a_uppercase_ord + (shift_value - z_uppercase_ord - 1)
			end
		end
	else
		# if not [A-Za-z], still need a value to convert back to chr
		shift_value = char.ord
	end

	cipher_text << shift_value.chr
	
end

puts "Cipher string: #{cipher_text}" 

