class Zhdict < Thor
  desc 'seed WORD_MODEL_NAME', 'seed the DB with CEDict words'
  def seed(word_model_name)
    word_class = word_model_name.classify
    Zhdict::Seeders::CEDict.seed(word_class)
  end
end
