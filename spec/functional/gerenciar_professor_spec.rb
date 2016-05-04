feature 'Gerenciar Professor' do
  
  scenario 'Incluir Professor' do 
    visit new_professor_path
    preencher_e_verificar_professor
  end

  scenario 'Alterar Professor' do 
    professor = FactoryGirl.create(:professor)
    visit edit_professor_path(professor)
    preencher_e_verificar_professor
  end

  scenario 'Excluir Professor' do 
    professor = FactoryGirl.create(:professor)
    visit professores_path
    click_link('Destroy')
  end

  def preencher_e_verificar_professor

    fill_in 'Nome Professor',     :with => "Luiz"
    fill_in 'Formação',  :with => "Engenharia Civil"

    click_button 'Salvar'

    expect(page).to have_content 'Nome: Luiz'
    expect(page).to have_content 'Formacao: Engenharia Civil'
  end
end