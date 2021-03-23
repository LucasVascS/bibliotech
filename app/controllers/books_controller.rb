class BooksController < ApplicationController

    def index
        @books = ['Perguntas e respostas sobre Gênesis',
         'Mostra-nos o Pai o que nos basta',
         'Crendo em Deus']

    end
end
