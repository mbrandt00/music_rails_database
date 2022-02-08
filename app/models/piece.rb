class Piece < ApplicationRecord
  belongs_to :composer

  def piano
    if multiple_instruments
      'Piano + Orchestra'
    else
      'Solo Piano Piece'
    end
  end

  def self.ordered
    all.order(:type_of_piece, :opus, number: :asc)
  end



  def self.multiple_instruments
    where("multiple_instruments = true")
  end

  def self.filter_compositions(params)
    pieces = where("composer_id = ?", params[:composer_id])
    if params[:filter].present?
      pieces = pieces.where("composition_date > ?", params[:filter][:first_year]) if params[:filter][:first_year].present?
      pieces = pieces.where("composition_date < ?", params[:filter][:last_year]) if params[:filter][:last_year].present?
      pieces = pieces.where(type_of_piece: params[:filter][:pieces]) if params[:filter][:pieces].present?
    end
    return pieces
  end

end
