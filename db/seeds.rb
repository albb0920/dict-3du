# encoding: UTF-8
#
# This script currently only builds 教育部國語辭典.

KCWU_JSON = "http://kcwu.csie.org/~kcwu/moedict/dict-revised.json.bz2"

if dict = Dict.find_by_id(Rails.application.config.dict_id)
  puts "[WARNING] I'll destroy and recreate dict(id=#{dict.id}) after 3s."
  sleep 5
  dict.destroy
end

dict = Dict.new_without_protection({id: Rails.application.config.dict_id, name: '教育部國語辭典'})
dict.save

require 'open-uri'
require 'open3'

puts "將從 #{KCWU_JSON} 匯入教育部國語辭典\n"

ProgressBar::Formatter::DEFAULT_FORMAT_STRING = '%t |%B| %c/%C(%p%%) %e'

dl_progress = nil, out_thread = nil, json = nil
open('http://kcwu.csie.org/~kcwu/moedict/dict-revised.json.bz2', 'rb',
    content_length_proc: ->(t){ dl_progress = ProgressBar.create(total:t, title: 'Download') },
    progress_proc: ->(s){ dl_progress.progress = s if progress_bar }) do |f|
  Open3.pipeline_rw('bzcat') do |pipe_in, pipe_out|
    pipe_in.set_encoding('ASCII-8BIT') # rails makes IO default encoding to UTF-8, WTF?

    bz_progress = ProgressBar.create(total: f.size, title: 'Decompress bzip2')
    out_thread = Thread.new do
      json = JSON.load(pipe_out)
    end
    until f.eof
      pipe_in.write  f.read(200)
      bz_progress.progress = f.pos
    end
    pipe_in.close

    print "Parsing JSON..."
    out_thread.join
    puts "done"
  end
end

progress_bar = ProgressBar.create(total: json.count, title: 'Build')
puts "Start building dict, #{json.count} entries to build, please be patient."

json.each do |entry_attrs|
  entry_attrs['heteronyms'].try(:map!) do |heteronym|
    heteronym['definitions'].try(:map!) do |definition|
      definition['quotes'] = definition.delete('quote').try(:map) do |quote|
        quote = quote.match(/^(?<source>.+?)：「(?<content>.+?)」$/)
        Quote.new_without_protection Hash[quote.names.zip(quote.captures)]
      end || []

      #XXX: link is still not supported
      definition.delete 'link'
      Definition.new_without_protection(definition)
    end
    Heteronym.new_without_protection(heteronym)
  end
  entry = Entry.new_without_protection(entry_attrs)
  entry.dict = dict

  entry.save
  progress_bar.increment
end
