# ecoding: utf-8
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
    text= ""
    ARGV.each do|a|
      puts "Argument: #{a}"
      text=text+a.to_s
    end
      @speaker.save_to_file text, '~/downloads/sound'
  end

  def save_text_as_audio(text)
    # TODO check from database

    file_name = Time.now
    puts file_name.to_i

    # file_dir = '~/desktop/news/'+"#{file_name.to_i}.mp3"

    file_dir = '/Desktop/news/'+"test.mp3"
    filename ="#{file_name.to_i}"

    @speaker.save_to_file text, '~/downloads/sound'

  end

end
#
# yandex_speaker = Yandex_Synthezator.new
# yandex_speaker.initialize_yandex()
# yandex_speaker.save_text_as_audio("Учёные обозначили
# ряд вопросов интеграционного взаимодействия в формате ЕАЭС.
# Как отметил в своем докладе главный научный сотрудник института
# экономики НАН КР, доктор экономических наук Калиль Джумабаев,
#  необходимо усилить потенциал внешних трудовых мигрантов из Кыргызстана.")
