require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Article.new title:'Título do artigo', body:'anything that you consider valid'  }
  before do
    Article.create! title:'Artigo de teste', body:'Corpo do artigo teste'
  end
  describe 'Validations' do
    describe 'Presence' do
      context 'When title nil/empty' do
        before { article.title = nil }
        it 'creates an invalid article' do
          expect(article.valid?).to be_falsey
        end
      end
      context 'When body is nil/empty' do
        before { article.body = nil }
        it 'creates an invalid article' do
          expect(article.valid?).to be_falsey 
        end
      end
    end
    describe 'Text length' do
      context 'when title length less than the expected' do
        before { article.title = 'test' }
        it 'creates an invalid article' do
          expect(article.valid?).to be_falsey
        end 
      end
      context 'when title length greater than the expected' do
        before { article.title = 'artic' }
        it 'creates a valid article' do
          expect(article.valid?).to be_truthy
        end
      end
    end
  end
  it 'has text included' do 
    expect(Article.first.body).to eq 'Corpo do artigo teste'
  end
end