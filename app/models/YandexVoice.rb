
class YandexVoice

  def initialize_yandex()
    key = File.open('secret key/key').readline.strip
    puts "Yandex KEY: #{key}"

    @speaker = YandexSpeechApi::Speaker.init
    @speaker.key      = key
    # speaker.voice    = 'Alyss'
    @speaker.language = 'russian'
    @speaker.speed    = 1
    @speaker.emotion  = 'good'
  end

  def save_text_as_audio(article)

    # TODO check from database
    file_name = Time.now
    puts file_name.to_i
    # file_dir = '/Desktop/news/'+"test.mp3"
    filename ="#{file_name.to_i}"

    if !File.exists? file_dir
      File.open(filename, "w+") do |file|
        @speaker.save_to_file text, filename
        article.audio=filename
        puts "saved"
      end
    end
  end

end
