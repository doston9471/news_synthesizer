require 'yandex_speech'

class Article < ApplicationRecord
  searchkick callbacks: :async
  belongs_to :portal_source
  #default_scope { order(created_at: :desc) }
  after_save :setup_yandex


  def setup_yandex

    load('yandex_synthezator.rb')

    # key = File.open('secret key/key').readline.strip
    # puts "Yandex KEY: #{key}"
    # @speaker = YandexSpeechApi::Speaker.init
    # @speaker.key      = key
    # # speaker.voice    = 'Alyss'
    # @speaker.language = 'russian'
    # @speaker.speed    = 1
    # @speaker.emotion  = 'good'
    #
    # @speaker.save_to_file 'i am test text'
    # save_text_as_audio("нтеграционного взаимо")
  end

  def save_text_as_audio(text)
    puts "I am called save text as audio"
    # TODO check from database
    file_name = Time.now
    puts file_name.to_i
    puts "Input text: #{text}"
    # file_dir = '/Desktop/news/'+"test.mp3"
    filename ="#{file_name.to_i}"
    @speaker.save_to_file 'text'
    article.audio=filename
    # if !File.exists? file_dir
      # File.open(filename, "wb") do |file|
      #
      #   puts "saved"
      # end
    # end
  end

  # yandex_speaker = Yandex_Synthezator.new
  # yandex_speaker.initialize_yandex()
  # yandex_speaker.save_text_as_audio("Учёные обозначили
  # ряд вопросов интеграционного взаимодействия в формате ЕАЭС.
  # Как отметил в своем докладе главный научный сотрудник института
  # экономики НАН КР, доктор экономических наук Калиль Джумабаев,
  #  необходимо усилить потенциал внешних трудовых мигрантов из Кыргызстана.")

end
