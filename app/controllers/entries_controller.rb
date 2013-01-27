#encoding: UTF-8
class EntriesController < ApplicationController
  load_resource :dict

  def match
    entry = @dict.entries.find_by_title(params[:keyword])
    if entry
      respond_to do |format|
       format.json do
         render json: entry
       end
      end
    else
      respond_to do |format|
        format.json { render json: { dict: {word: params[:keyword], error: '查無此辭'}} }
      end
    end
  end
end
