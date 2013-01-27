#encoding: UTF-8
class EntriesController < ApplicationController
  def match
    entry = Entry.find_by_title(params[:keyword])
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
