# caesar_cipher.rb
#
class CaesarCipher
  attr_accessor :phrase, :key

  def initialize(**params)
    @phrase = params[:phrase].strip

    @key = params[:key].to_i
  end

  def encode
    return "" if phrase == ""

    return phrase if key < 1
  end

end
