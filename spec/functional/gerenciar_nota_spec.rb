feature 'Gerenciar Nota' do

  before(:each) do
    @inscricao = create(:inscricao, nome: "Davi")
    @curso = create(:curso, nome: "Ruby on Rails")
  end

  let(:dados) do {
    nome: "Davi",
    curso: "Ruby on Rails",
    nota: 7.5,
    frequencia: "4"
   }
  end

  scenario 'Incluir Nota' do #, :js => true  do
    visit new_nota_path
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Alterar Nota' do #, :js => true  do
    nota = FactoryGirl.create(:nota, inscricao: @inscricao, curso: @curso)
    visit edit_nota_path(nota)
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Excluir Nota' do #, :js => true  do
    nota = FactoryGirl.create(:nota, inscricao: @inscricao, curso: @curso)
    visit notas_path
    click_link 'Excluir'
  end

  def preencher(dados)
    select dados[:nome], from: "Nome Aluno"
    select dados[:curso], from: "Nome Curso"
    fill_in 'Nota',  with: dados[:nota]
    fill_in 'Frequência',  with: dados[:frequencia]
  end

  def verificar(dados)
    page.should have_content "Inscricao: #{dados[:nome]}"
    page.should have_content "Curso: #{dados[:curso]}"
    page.should have_content "Nota: #{dados[:nota]}"
    page.should have_content "Frequencia: #{dados[:frequencia]}"
  end
end