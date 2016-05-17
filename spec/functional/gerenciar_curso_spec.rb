feature 'Gerenciar Curso' do

  before(:each) do
    @professor = create(:professor, nome: "Luiz")
  end

  let(:dados) do {
    nome_pro: "Ruby on Rails",
    descricao: "Programação OO",
    nome: "Luiz"
   }
  end

  scenario 'Incluir Curso' do #, :js => true  do
    visit new_curso_path
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Alterar Curso' do #, :js => true  do
    curso = FactoryGirl.create(:curso, professor: @professor)
    visit edit_curso_path(curso)
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Excluir Curso' do #, :js => true  do
    curso = FactoryGirl.create(:curso, professor: @professor)
    visit cursos_path
    click_link 'Excluir'
  end

  def preencher(dados)
    fill_in 'Nome Curso',  with: dados[:nome_pro]
    fill_in 'Descrição Curso',  with: dados[:descricao]
    select dados[:nome], from: "Nome Professor"
  end
 
  def verificar(dados)
    page.should have_content "Nome: #{dados[:nome_pro]}"
    page.should have_content "Descricao: #{dados[:descricao]}"
    page.should have_content "Professor: #{dados[:nome]}"
  end
end