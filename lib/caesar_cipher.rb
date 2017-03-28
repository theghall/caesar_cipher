# caesar_cipher.rb
#
require 'byebug'
class CaesarCipher
  attr_accessor :phrase, :key
  attr_reader :secret_key 

  def initialize(**params)
    @phrase = params[:phrase].strip

    @key = params[:key].to_i

    @secret_key = encode
  end

  private

  def encode
    return "" if phrase == ""

    return phrase if key < 1

    a_lowercase_ord = "a".ord

    z_lowercase_ord = "z".ord

    a_uppercase_ord = "A".ord

    z_uppercase_ord = "Z".ord

    encode_string = ""

    self.phrase.each_char do |char|
    	# Only shift [A-Za-z]
    	if char =~ /\p{alpha}/
    		shift_value = char.ord + key

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

    	encode_string += shift_value.chr
	
    end

    encode_string
  end
end
