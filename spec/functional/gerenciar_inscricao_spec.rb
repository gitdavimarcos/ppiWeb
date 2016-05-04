feature 'Gerenciar Inscrição' do

  before(:each) do
    @curso = create(:curso, nome: "Ruby on Rails")
  end

  let(:dados) do {
    nome_aluno: "Davi",
    endereco: "Rua das Palmeiras",
    telefone: "22 99988-7733",
    cidade: "Campos",
    nome: "Ruby on Rails"
   }
  end

  scenario 'Incluir Inscrição' do #, :js => true  do
    visit new_inscricao_path
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Alterar Inscrião' do #, :js => true  do
    inscricao = FactoryGirl.create(:inscricao, curso: @curso)
    visit edit_inscricao_path(inscricao)
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Excluir inscricao' do #, :js => true  do
    inscricao = FactoryGirl.create(:inscricao, curso: @curso)
    visit inscricoes_path
    click_link 'Destroy'
  end

  def preencher(dados)
    fill_in 'Nome Aluno',  with: dados[:nome_aluno]
    fill_in 'Nome Endereço',  with: dados[:endereco]
    fill_in 'Telefone',  with: dados[:telefone]
    fill_in 'Cidade',  with: dados[:cidade]
    select dados[:nome], from: "Nome Curso"
  end
 
  def verificar(dados)
    page.should have_content "Nome: #{dados[:nome_aluno]}"
    page.should have_content "Endereco: #{dados[:endereco]}"
    page.should have_content "Telefone: #{dados[:telefone]}"
    page.should have_content "Cidade: #{dados[:cidade]}"
    page.should have_content "Curso: #{dados[:nome]}"
  end
end