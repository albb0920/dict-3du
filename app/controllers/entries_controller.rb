#encoding: UTF-8
class EntriesController < ApplicationController
  load_resource :dict

  def index
    render text: "API endpoint at <br> /dict/(word).json <br> or <br> /idiom/(word).json"
  end

  def match
    entry = @dict.entries.find_by_title(params[:keyword])
    json = {@dict.type_string => (entry ?
    entry.as_json :
    {word: params[:keyword], error: '查無此辭'}) }

    respond_to do |format|
     format.json do
       render json: json
     end
    end
  end
end
