# encoding: binary
# frozen_string_literal: true

module RbNaCl
  module SecretBoxes
    # The SecretBox class boxes and unboxes messages
    #
    # This class uses the given secret key to encrypt and decrypt messages.
    #
    # It is VITALLY important that the nonce is a nonce, i.e. it is a number used
    # only once for any given pair of keys.  If you fail to do this, you
    # compromise the privacy of the messages encrypted. Give your nonces a
    # different prefix, or have one side use an odd counter and one an even counter.
    # Just make sure they are different.
    #
    # The ciphertexts generated by this class include a 16-byte authenticator which
    # is checked as part of the decryption.  An invalid authenticator will cause
    # the unbox function to raise.  The authenticator is not a signature.  Once
    # you've looked in the box, you've demonstrated the ability to create
    # arbitrary valid messages, so messages you send are repudiable.  For
    # non-repudiable messages, sign them before or after encryption.
    class XSalsa20Poly1305
      extend Sodium

      sodium_type :secretbox
      sodium_primitive :xsalsa20poly1305
      sodium_constant :KEYBYTES
      sodium_constant :NONCEBYTES
      sodium_constant :ZEROBYTES
      sodium_constant :BOXZEROBYTES

      sodium_function :secretbox_xsalsa20poly1305,
                      :crypto_secretbox_xsalsa20poly1305,
                      %i[pointer pointer ulong_long pointer pointer]

      sodium_function :secretbox_xsalsa20poly1305_open,
                      :crypto_secretbox_xsalsa20poly1305_open,
                      %i[pointer pointer ulong_long pointer pointer]

      # Create a new SecretBox
      #
      # Sets up the Box with a secret key fro encrypting and decrypting messages.
      #
      # @param key [String] The key to encrypt and decrypt with
      #
      # @raise [RbNaCl::LengthError] on invalid keys
      #
      # @return [RbNaCl::SecretBox] The new Box, ready to use
      def initialize(key)
        @key = Util.check_string(key, KEYBYTES, "Secret key")
      end

      # Encrypts a message
      #
      # Encrypts the message with the given nonce to the key set up when
      # initializing the class.  Make sure the nonce is unique for any given
      # key, or you might as well just send plain text.
      #
      # This function takes care of the padding required by the NaCL C API.
      #
      # @param nonce [String] A 24-byte string containing the nonce.
      # @param message [String] The message to be encrypted.
      #
      # @raise [RbNaCl::LengthError] If the nonce is not valid
      #
      # @return [String] The ciphertext without the nonce prepended (BINARY encoded)
      def box(nonce, message)
        Util.check_length(nonce, nonce_bytes, "Nonce")
        msg = Util.prepend_zeros(ZEROBYTES, message)
        ct  = Util.zeros(msg.bytesize)

        success = self.class.secretbox_xsalsa20poly1305(ct, msg, msg.bytesize, nonce, @key)
        raise CryptoError, "Encryption failed" unless success

        Util.remove_zeros(BOXZEROBYTES, ct)
      end
      alias encrypt box

      # Decrypts a ciphertext
      #
      # Decrypts the ciphertext with the given nonce using the key setup when
      # initializing the class.
      #
      # This function takes care of the padding required by the NaCL C API.
      #
      # @param nonce [String] A 24-byte string containing the nonce.
      # @param ciphertext [String] The message to be decrypted.
      #
      # @raise [RbNaCl::LengthError] If the nonce is not valid
      # @raise [RbNaCl::CryptoError] If the ciphertext cannot be authenticated.
      #
      # @return [String] The decrypted message (BINARY encoded)
      def open(nonce, ciphertext)
        Util.check_length(nonce, nonce_bytes, "Nonce")
        ct = Util.prepend_zeros(BOXZEROBYTES, ciphertext)
        message = Util.zeros(ct.bytesize)

        success = self.class.secretbox_xsalsa20poly1305_open(message, ct, ct.bytesize, nonce, @key)
        raise CryptoError, "Decryption failed. Ciphertext failed verification." unless success

        Util.remove_zeros(ZEROBYTES, message)
      end
      alias decrypt open

      # The crypto primitive for the SecretBox instance
      #
      # @return [Symbol] The primitive used
      def primitive
        self.class.primitive
      end

      # The nonce bytes for the SecretBox class
      #
      # @return [Integer] The number of bytes in a valid nonce
      def self.nonce_bytes
        NONCEBYTES
      end

      # The nonce bytes for the SecretBox instance
      #
      # @return [Integer] The number of bytes in a valid nonce
      def nonce_bytes
        NONCEBYTES
      end

      # The key bytes for the SecretBox class
      #
      # @return [Integer] The number of bytes in a valid key
      def self.key_bytes
        KEYBYTES
      end

      # The key bytes for the SecretBox instance
      #
      # @return [Integer] The number of bytes in a valid key
      def key_bytes
        KEYBYTES
      end
    end
  end
end
