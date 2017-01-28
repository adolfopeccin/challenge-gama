# encoding: UTF-8
require_relative '../app'
require 'minitest/autorun'
require 'rack/test'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_busca_de_endereco
    get '/'
    assert_match /Busca de Endereço/, last_response.body
  end

  def test_home_busca_com_endereco
  	endereco = 'Rua Casa do Ator, 294'.gsub(' ', '+')
    get '/', url: endereco
    assert_match /Vila Olimpia/, last_response.body
  end
end
