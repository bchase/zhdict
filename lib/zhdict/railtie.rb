module Zhdict
  class Railtie < Rails::Railtie
    generators do
      require GEM_ROOT.join('lib/generators/zhdict/zhdict_generator')
    end
  end
end
