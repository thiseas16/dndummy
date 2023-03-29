class HandbookController < ApplicationController
  def home
  end

  def spells_index
    @spells = Spell.paginate(page: params[:page], per_page: 7)

    if params[:search].present?
      search_term = params[:search].downcase.titleize
      @spells = @spells.where("name LIKE ?", "%#{search_term}%")
    end

    if params[:lvl].present?
      level = params[:lvl].to_i
      @spells = @spells.where(lvl: level)
    end

    if params[:casting_time].present?
      casting_time = params[:casting_time]
      @spells = @spells.where(casting_time: casting_time)
    end

    if params[:duration].present?
      duration = params[:duration]
      @spells = @spells.where(duration: duration)
    end

    if params[:range].present?
      range = params[:range]
      @spells = @spells.where(range: range)
    end

    if params[:dmg_type].present?
      damage_type = params[:dmg_type]
      @spells = @spells.where(dmg_type: damage_type)
    end
  end

  def spells_show
    @spell = Spell.find(params[:id])
  end

  def classes_index
    @class_lists = ClassList.all
  end

  def classes_show
    @class_list = ClassList.find(params[:id])
  end

  def races_index
    @races = Race.all
  end

  def races_show
    @race = Race.find(params[:id])
  end

  def traits_index
    @traits = Trait.all
  end

  def traits_show
    @trait = Trait.find(params[:id])
  end

  def equipment_index
    # @equipment = Item.all
    @equipment = Item.paginate(page: params[:page], per_page: 40)
  end

  def equipment_show
    @equipment = Item.find(params[:id])
  end

  def feats_index
    # @feats = Feat.all
    @feats = Feat.paginate(page: params[:page], per_page: 36)
  end

  def feats_show
    @feat = Feat.find(params[:id])
  end

  def languages_index
    @languages = Language.all
  end

  def languages_show
    @language = Language.find(params[:id])
  end

  def proficiencies_index
    # @proficiencies = Proficiency.all
    @proficiencies = Proficiency.paginate(page: params[:page], per_page: 40)
  end

  def proficiencies_show
    @proficiency = Proficiency.find(params[:id])
  end
end
