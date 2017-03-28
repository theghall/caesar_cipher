Implements the Casesar Cipher in the class CaesarCipher.

An object of CaesarCipher is instantiated with the following hash:
:phrase => &lt;string&gt;, :key => &lt;n&gt; 

where n is a number greater than 0.  An empty string is not encoded
and using a key of 0 will simply return the given phrase.  
One note: passing a key of 26 will give you the same phrase back due
to the wraparound.
