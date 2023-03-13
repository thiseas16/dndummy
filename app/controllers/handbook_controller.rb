class HandbookController < ApplicationController
  def home
  end

  def spells_index
    # @spells = Spell.all
    @spells = Spell.paginate(page: params[:page], per_page: 13)
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
    @equipment = Item.all
  end

  def equipment_show
    @equipment = Item.find(params[:id])
  end

  def feats_index
    @feats = Feat.all
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
    @proficiencies = Proficiency.all
  end

  def proficiencies_show
    @proficiency = Proficiency.find(params[:id])
  end
end
