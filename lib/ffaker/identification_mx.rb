# encoding: utf-8

require 'ffaker/identification_es'

module FFaker
  module IdentificationMX
    # Author Guapolo <github.com/guapolo>
    extend ModuleUtils
    extend self

    CONSONANTS = %w(B C D F G H J K L M N P Q R S T V W X Y Z).freeze
    VOWELS = %w(A E I O U).freeze
    HOMOCLAVE = CONSONANTS + VOWELS + [*'0'..'9']

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona física
    def rfc_persona_fisica
      consonants_n = CONSONANTS + ["Ñ"]
      all_letters = consonants_n + VOWELS
      date = ::Time.at(rand * ::Time.now.to_f).strftime('%y%m%d')
      "#{consonants_n.sample}#{VOWELS.sample}#{all_letters.sample(2).join}#{date}#{HOMOCLAVE.sample(3).join}"
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.) para persona moral
    def rfc_persona_moral
      consonants_n_amp = CONSONANTS + ["Ñ", '&']
      all_letters = consonants_n_amp + VOWELS
      date = ::Time.at(rand * ::Time.now.to_f).strftime('%y%m%d')
      "#{all_letters.sample(3).join}#{date}#{HOMOCLAVE.sample(3).join}"
    end

    # http://es.wikipedia.org/wiki/Registro_Federal_de_Contribuyentes_(M%C3%A9xico)
    # Registro Federal de Contribuyentes (R.F.C.)
    def rfc
      [rfc_persona_moral, rfc_persona_fisica].sample
    end

    # http://es.wikipedia.org/wiki/Clave_%C3%9Anica_de_Registro_de_Poblaci%C3%B3n
    # Clave Única de Registro de Población
    def curp
      all_letters = CONSONANTS + VOWELS
      hm = %w(H M)
      date = ::Time.at(rand * ::Time.now.to_f).strftime('%y%m%d')
      "#{CONSONANTS.sample}#{VOWELS.sample}#{all_letters.sample(2).join}#{date}#{hm.sample}#{ESTADOS_CURP.sample}#{CONSONANTS.sample(3).join}#{HOMOCLAVE.sample}#{rand(10)}"
    end
  end
end
