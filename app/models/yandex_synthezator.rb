require 'yandex_speech'

class Yandex_Synthezator

  def initialize_yandex()
    key = File.open('secret key/key').readline.strip
    @speaker = YandexSpeechApi::Speaker.init
    @speaker.key      = key
    # speaker.voice    = 'Alyss'
    @speaker.language = 'russian'
    @speaker.speed    = 1
    @speaker.emotion  = 'good'
  end

  def save_text_as_audio(text)
    # TODO check from database

    file_name = Time.now
    puts file_name.to_i

    # file_dir = '~/desktop/news/'+"#{file_name.to_i}.mp3"

    file_dir = '/Desktop/news/'+"test.mp3"
    filename ="#{file_name.to_i}"

    if !File.exists? file_dir
      File.open(filename, "wb") do |file|
        @speaker.save_to_file text, filename
        puts "saved"
      end
    end

  end

end

yandex_speaker = Yandex_Synthezator.new
yandex_speaker.initialize_yandex()
yandex_speaker.save_text_as_audio("Учёные обозначили
ряд вопросов интеграционного взаимодействия в формате ЕАЭС.
Как отметил в своем докладе главный научный сотрудник института
экономики НАН КР, доктор экономических наук Калиль Джумабаев,
 необходимо усилить потенциал внешних трудовых мигрантов из Кыргызстана.")
