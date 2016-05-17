feature 'Gerenciar Turma' do

  before(:each) do
    @inscricao = create(:inscricao, nome: "Davi")
    @curso = create(:curso, nome: "Ruby on Rails")
    @professor = create(:professor, nome: "Luiz")
  end

  let(:dados) do {
    inscricao: "Davi",
    curso: "Ruby on Rails",
    professor: "Luiz",
    turma: "310",
    sala: "H-12",
    data_ini: "01/01/2016",
    data_ter: "30/11/2016",
    turno: "Noturno"
   }
  end

  scenario 'Incluir Turma' do #, :js => true  do
    visit new_turma_path
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Alterar Turma' do #, :js => true  do
    turma = FactoryGirl.create(:turma, inscricao: @inscricao, curso: @curso, professor: @professor)
    visit edit_turma_path(turma)
    preencher(dados)
    click_button 'Salvar'
    verificar(dados)
  end

  scenario 'Excluir Turma' do #, :js => true  do
    turma = FactoryGirl.create(:turma, inscricao: @inscricao, curso: @curso, professor: @professor)
    visit turmas_path
    click_link 'Excluir'
  end

  def preencher(dados)
    select dados[:inscricao], from: "Nome Aluno"
    select dados[:curso], from: "Nome Curso"
    select dados[:professor], from: "Nome Professor"
    fill_in 'Turma',  with: dados[:turma]
    fill_in 'Sala',  with: dados[:sala]
    fill_in 'Data Início',  with: dados[:data_ini]
    fill_in 'Data Término',  with: dados[:data_ter]
    fill_in 'Turno',  with: dados[:turno]
  end

  def verificar(dados)
    page.should have_content "Inscricao: #{dados[:nome]}"
    page.should have_content "Curso: #{dados[:curso]}"
    page.should have_content "Professor: #{dados[:professor]}"
    page.should have_content "Turma: #{dados[:turma]}"
    page.should have_content "Sala: #{dados[:sala]}"
    page.should have_content "Data ini: #{dados[:data_ini]}"
    page.should have_content "Data ter: #{dados[:data_ter]}"
    page.should have_content "Turno: #{dados[:turno]}"
  end
end